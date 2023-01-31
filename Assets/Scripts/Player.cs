using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using System.Linq;
using UnityEngine;
using UnityEngine.UI;
using System.Security.Cryptography;

public enum PlayerLocation : int
{
    Left = -1,
    Center = 0,
    Right = 1
}

public class Player : MonoBehaviour
{
    public GameObject menu;

    // 인스턴스 변수 선언
    public static Player instance;
     
    // 애니매이터 변수 선언
    Animator animator;
    // 걸음 관련 변수 선언
    public bool leftUp, rightUp;
    public static float stepRecordTime;
    public static float decreaseSpeedTimer;
    public static List<float> steps;

    // 행동 관련 번수 선언
    public static Vector3 lastPositionLeftFoot;
    public static Vector3 lastPositionRightFoot;
    public static Vector3 lastPositionHead;

    public bool isJumping;
    public float jumpTimer;

    public bool isStumbling;
    public float stumbleTimer;

    public bool isPunching;
    public float punchTimer;

    public float speed;

    // 콤보, 체력 관련 변수, 상수 선언
    public int maxCombo;
    public int combo;
    public int hp;
    public int maxHp;
    public float time;
    public float playtime;
    public float avatarPosition;
    public PlayerLocation curLocation;

    public GameObject transition;
    public int afterBattle;

    BoxCollider collider;
    HighlightTiles highlightTiles;
    public GameCanvas gameCanvas;

    public GameObject leftFloorTile;
    public GameObject centerFloorTile;
    public GameObject rightFloorTile;
    // 인스턴스 설정
    private void Awake() { instance = this;
    }

    void Start()
    {
        highlightTiles = GameObject.Find("HighlightTiles").GetComponent<HighlightTiles>();
        animator = GetComponent<Animator>();
        collider = gameObject.GetComponent<BoxCollider>();
        gameCanvas = GameObject.Find("GameCanvas").GetComponent<GameCanvas>();
        // 배틀이 끝난 뒤면
        if (PlayerPrefs.GetInt("afterBattle") == 1)
        {
            // 게임 상태로 전환
            GameManager.instance.SetGameState(GameState.Game);

            // 배틀 씬이 종료될때 기록된 이전까지의 플레이에서의 기록들을 불러옴
            time = PlayerPrefs.GetFloat("time");
            playtime = PlayerPrefs.GetFloat("playtime");
            hp = PlayerPrefs.GetInt("hp");
            maxHp = PlayerPrefs.GetInt("maxHp");
            speed = PlayerPrefs.GetFloat("speed");
            combo = PlayerPrefs.GetInt("combo");
            maxCombo = PlayerPrefs.GetInt("maxCombo");

            // 이전 기록 초기화
            PlayerPrefs.DeleteAll();
            PlayerPrefs.SetInt("afterBattle",0);
        }
        // 배틀 이후가 아니면(처음 시작에 해당)
        else
        {
            // 시작시 타일을 제외한 변수들을 초기화
            InitialValues();
            InitialSetting();
        }
    }
    // 타일, 기록 관련 변수, 세팅 관련 변수 초기화 후 플레이어를 센터로
    public void InitialAll()
    {
        InitialTile();
        InitialValues();
        InitialSetting();
        HandlePlayerLocation(curLocation);
    }
    // 월드의 타일 두 장을 제거
    public void InitialTile()
    {
        if (GameManager.instance.curTile != null && GameManager.instance.nextTile != null)
        {
            Destroy(GameManager.instance.curTile);
            Destroy(GameManager.instance.nextTile);
        }
    }
    // 기록 관련 변수 초기화
    public void InitialValues()
    {
        PlayerPrefs.DeleteAll();

        leftUp = false;
        rightUp = false;

        stepRecordTime = 0;
        decreaseSpeedTimer = 0;

        lastPositionLeftFoot = Vector3.zero;
        lastPositionRightFoot = Vector3.zero;
        lastPositionHead = Vector3.zero;

        isJumping = false;
        jumpTimer = 0;
        isStumbling = false;
        stumbleTimer = 0;
        isPunching = false;
        punchTimer = 0;
        speed = 0;
        combo = 0;
        maxCombo = 0;
        avatarPosition = 0;
        curLocation = PlayerLocation.Center;
        InitialStepRecords();
    }
    // 설정 관련 변수 초기화
    public void InitialSetting()
    {
        if (ConstInfo.time == 0)
            ConstInfo.time = 60;
        if (ConstInfo.startHp == 0)
            ConstInfo.startHp = 50;
        if (ConstInfo.maxHp == 0)
            ConstInfo.maxHp = 100;
        time = ConstInfo.time;
        hp = ConstInfo.startHp;
        maxHp = ConstInfo.maxHp;
        playtime = time;
    }
    void Ondestroy()
    {
        PlayerPrefs.SetInt("afterBattle", 0);
    }
    // 걸음 시간 리스트 초기화 (0)
    public static void InitialStepRecords()
    {
        steps = Enumerable.Repeat<float>(0, 3).ToList();
    }

    // 걸음 시간 측정 (+ fixedDeltaTime)
    private void FixedUpdate()
    {
        if (!isJumping)
        {
            stepRecordTime += Time.fixedDeltaTime;
            decreaseSpeedTimer += Time.fixedDeltaTime;
        }
    }
    void Update()
    {
        // 게임 상태에 들어오면
        if (GameManager.instance.GetGameState() == GameState.Game)
        {
            // 시간을 실시간으로 감소, 입력 핸들링, 속도 업데이트, 인풋에 따른 액션 출력, 콤보와 시간, 체력 출력
            time -= Time.deltaTime;
            HandleInput();
            SpeedUpdate(speed);
            HandlePlayerAction();
            gameCanvas.DisplayTime();
            gameCanvas.DisplayHp();
            gameCanvas.DisplaySpeed();
            // 타임이나 체력이 0 이하로 떨어지면
            if (time <= 0 || hp <= 0)
            {
                // 결과창으로 이동, 기존 정보 초기화
                GameManager.instance.SetGameState(GameState.Result);
                GameManager.instance.SetStateChanged(true);
                PlayerPrefs.DeleteAll();
            }
            // 최대 콤보 갱신
            if (combo > maxCombo)
                maxCombo = combo;

        }
        else
        {
            // 현재 속도를 초기화하지 않고 애니메이션을 멈추기 위해서 speed 변수를 초기화하지 않고 직접 값으로 호출
            SpeedUpdate(0);
            // 점프, 펀치, 비틀 상태 초기화
            InitialJumpState();
            InitialPunchState();
            InitialStumbleState();
        }
        


    }
    void HandleKinectPlayer()
    {
        //키넥트가 받아들이는 내 위치를 좌표값에 맞게 변환
        avatarPosition = (Avatar.userPosition.x * ((ConstInfo.lineWidth * 3) / 1920) + ConstInfo.tileX);
        //ispunching
        if ((Avatar.userPositionLeftHand.z > Avatar.userPositionHead.z + Avatar.distanceHandElbow * 5 / 3) ||
             (Avatar.userPositionRightHand.z > Avatar.userPositionHead.z + Avatar.distanceHandElbow * 5 / 3))
        { isPunching = true; }
        else if (isJumping == false) { HandleJump(); }
        if (avatarPosition < 107)
        {
            HandlePlayerLocation(PlayerLocation.Left);
        }
        else if (avatarPosition > 121)
        {
            HandlePlayerLocation(PlayerLocation.Right);
        }
        else
        {
            HandlePlayerLocation(PlayerLocation.Center);
        }
    }
    
    // 결음 기록 조건 만족 시 함수 호출
    void HandleSteps()
    {
        if (decreaseSpeedTimer >= 2 && !Player.instance.isJumping)
        {
            decreaseSpeedTimer = 0;
            steps.Add(0);
            steps.RemoveAt(0);
        }
        //왼발 오른발 여부
        if ((Avatar.userPositionLeftFoot.y > ConstInfo.stepHeight && Avatar.userPositionRightFoot.y < ConstInfo.stepHeight) && stepRecordTime != 0)
            leftUp = true;
        else if ((Avatar.userPositionRightFoot.y > ConstInfo.stepHeight && Avatar.userPositionLeftFoot.y < ConstInfo.stepHeight) && stepRecordTime != 0)
            rightUp = true;
        //왼발과 오른발이 leftup rightup 상황에서만 step인식
        if (leftUp && rightUp)
        {
            HandleStep();
            leftUp = false;
            rightUp = false;
        }
        //step을 세번 받은 것의 평균값 + 5 의 속도를 계속해서 더해줌
        speed = 5 + steps.Average();
        if (speed > 60)
            speed = 60;
    }

    // 걸음시간 기록 및 초기화
    void HandleStep()
    {
        //왼발 오른발을 교차하면서 걸을때 시간을 저장
        steps.Add(10/stepRecordTime);
        steps.RemoveAt(0);
        stepRecordTime = 0;
        decreaseSpeedTimer = 0;
    }
    // 게임 중 입력 핸들링
    void HandleInput()
    {
        if (GameManager.instance.GetKinectState() == true)
        {
            HandleKinectPlayer();
            HandleSteps();
        }
        // 윗방향키 입력시 속도 증가
        if (Input.GetKeyDown(KeyCode.UpArrow) && speed < 60)
            speed += 5;
        // 아랫방향키 입력시 속도 감소
        else if (Input.GetKeyDown(KeyCode.DownArrow) && speed > 5)
            speed -= 5;
        // 왼방향키 입력시 현위치가 왼쪽 타일이 아니면 왼쪽 타일로 이동
        else if ((Input.GetKeyDown(KeyCode.LeftArrow) && curLocation != PlayerLocation.Left))
            HandlePlayerLocation(PlayerLocation.Left);
        // 오른방향키 입력시 현위치가 오른쪽 타일이 아니면 오른쪽 타일로 이동
        else if ((Input.GetKeyDown(KeyCode.RightArrow) && curLocation != PlayerLocation.Right))
            HandlePlayerLocation(PlayerLocation.Right);
        // f 입력시 현위치가 가운데 타일이 아니면 가운데 타일로 이동
        else if (Input.GetKeyDown(KeyCode.F) && curLocation != PlayerLocation.Center)
            HandlePlayerLocation(PlayerLocation.Center);
        // 스페이스 입력시 다른 모션 도중이 아니면 점프 상태로 변환
        else if (Input.GetKeyDown(KeyCode.Space) && !IsPlayerActing())
            isJumping = true;
        // 왼쪽 컨트롤 입력시 다른 모션 도중이 아니면 펀치 상태로 변환
        else if (Input.GetKeyDown(KeyCode.LeftControl) && !IsPlayerActing())
            isPunching = true;
        // 현재 서있는 타일을 하이라이트
        HandleFloorTileHighlight();
    }

    // 속도에 따라 애니메이션이 변화하므로 애니메이터의 속도 업데이트를 해줘야함
    void SpeedUpdate(float speed)
    {
        animator.SetFloat("speed", speed);
    }
    // 비틀대거나 점프중이거나 펀치중이면 true 반환, 아니면 false 반환
    bool IsPlayerActing()
    {
        if (isStumbling || isJumping || isPunching)
            return true;
        return false;
    }
    // 플레이어 동작 업데이트
    void HandlePlayerAction()
    {
        if (isStumbling)
            HandlePlayerStumbling();
        else if (isJumping)
            HandlePlayerJumping();
        else if (isPunching)
            HandlePlayerPunching();
        HandlePlayerActionTimer();
    }

    // 플레이어 점프 애니메이션
    void HandlePlayerJumping()
    {
        animator.SetBool("isJumping", true);
        // 플레이어의 콜리젼 박스를 위로 움직임
        collider.center = (new Vector3(ConstInfo.originalColliderX, ConstInfo.jumpingColliderY, ConstInfo.originalColliderZ));
        
    }

    // 플레이어 발걸림 애니메이션 (발걸림 도중 다른 동작 불가)
    public void HandlePlayerStumbling()
    {
        animator.SetBool("isStumbling", true);
        speed = 5;
    }

    // 플레이어 펀치 애니메이션 (펀치 도중 점프 가능)
    public void HandlePlayerPunching()
    {
        animator.SetBool("isPunching", true);
    }

    // 파라미터로 왼쪽, 가운데, 오른쪽을 받아 플레이어 캐릭터를 그 위치로 이동
    public void HandlePlayerLocation(PlayerLocation MovedLocation)
    {
        if (MovedLocation == PlayerLocation.Left)
        {
            curLocation = PlayerLocation.Left;
            transform.position = new Vector3(100, ConstInfo.playerY, ConstInfo.playerZ);
        }
        else if (MovedLocation == PlayerLocation.Center)
        {
            curLocation = PlayerLocation.Center;
            transform.position = new Vector3(114, ConstInfo.playerY, ConstInfo.playerZ);
        }
        else
        {
            curLocation = PlayerLocation.Right;
            transform.position = new Vector3(128, ConstInfo.playerY, ConstInfo.playerZ);
        }
        highlightTiles.Highlight(curLocation);
    }
    // 점프 상태 초기화 (초기화 시 펀치 상태도 초기화)
    public void InitialJumpState()
    {
        isJumping = false;
        isPunching = false;
        jumpTimer = 0;
        collider.center = (new Vector3(ConstInfo.originalColliderX, ConstInfo.originalColliderY, ConstInfo.originalColliderZ));
        animator.SetBool("isJumping", false);
    }

    // 발걸림 상태 초기화
    public void InitialStumbleState()
    {
        isStumbling = false;
        stumbleTimer = 0;
        animator.SetBool("isStumbling", false);
    }

    // 펀치 상태 초기화
    public void InitialPunchState()
    {
        isPunching = false;
        punchTimer = 0;
        animator.SetBool("isPunching", false);
    }

    // 플레이어 동작 타이머 설정
    void HandlePlayerActionTimer()
    {
        if (isJumping)
        {
            jumpTimer += Time.deltaTime;
            if (jumpTimer >= ConstInfo.actionTimer)
                InitialJumpState();
        }
        if (isStumbling)
        {
            stumbleTimer += Time.deltaTime;
            if (stumbleTimer >= ConstInfo.actionTimer)
                InitialStumbleState();
        }
        if (isPunching)
        {
            punchTimer += Time.deltaTime;
            if (punchTimer >= ConstInfo.actionTimer)
                InitialPunchState();
        }
    }

    void OnCollisionEnter(Collision col)
    {
        if (col.gameObject.tag == "Heart Tile")
        {
            if(hp < maxHp)
                hp++;
            gameCanvas.DisplayHpIncrease();
            gameCanvas.DisplayCombo();
            col.gameObject.GetComponent<Heart>().HeartPop();
        }
        else if (col.gameObject.tag == "Hurdle Tile" || col.gameObject.tag == "Trap Tile")
        {
            isStumbling = true;
            combo = 0;
            if (hp / 2 > 10)
                hp -= (int)hp / 2;
            else
                hp -= 10;
            gameCanvas.DisplayHpDecrease();
            HandlePlayerStumbling();
            if (col.gameObject.tag == "Hurdle Tile")
                col.gameObject.GetComponent<Hurdle>().GetDown();
        }
        else if (col.gameObject.tag == "Balloon Tile")
        {
            if (isPunching)
            {
                combo++;
                time += 3;
                playtime += 3;
                col.gameObject.GetComponent<Balloon>().GoAway();
                gameCanvas.DisplayTimeIncrease();
                gameCanvas.DisplayCombo();
            }
            else
            {
                isStumbling = true;
                combo = 0;
                if (hp / 2 > 10)
                    hp -= (int)hp / 4;
                else
                    hp -= 5;
                gameCanvas.DisplayHpDecrease();
                col.gameObject.GetComponent<Balloon>().Boom();
                HandlePlayerStumbling();
            }
        }
        else if (col.gameObject.tag == "Pass Tile")
        {
            combo++;
            gameCanvas.DisplayCombo();
        }
        else if (col.gameObject.tag == "Battle Tile")
        {   
            PlayerPrefs.SetFloat("time", time);
            PlayerPrefs.SetFloat("playtime", playtime);
            PlayerPrefs.SetInt("hp", hp);
            PlayerPrefs.SetInt("maxHp", maxHp);
            PlayerPrefs.SetFloat("speed", speed);
            PlayerPrefs.SetInt("combo", combo);
            PlayerPrefs.SetInt("maxCombo", maxCombo);
            PlayerPrefs.SetInt("afterBattle", 1);
            GameManager.instance.SetGameState(GameState.Battle);
            transition.GetComponent<Animator>().SetBool("animateIn", true);
            StartCoroutine(SceneLoad());
        }
        col.gameObject.GetComponent<BoxCollider>().enabled = false;
    }

    // 점프 조건 (이전 프레임보다 양 발 모두 jumpHeight 이상 증가 + 발높이 차가 0.3 이하 + 양발의 x변화량이 5 미만)
    void HandleJump()
    {
        isJumping = lastPositionLeftFoot.y + ConstInfo.jumpHeight < Avatar.userPositionLeftFoot.y
            && lastPositionRightFoot.y + ConstInfo.jumpHeight < Avatar.userPositionRightFoot.y
            && lastPositionHead.y + ConstInfo.jumpHeight < Avatar.userPositionHead.y
            && lastPositionLeftFoot.y != 0 && lastPositionRightFoot.y != 0
            && Mathf.Abs(lastPositionLeftFoot.y - lastPositionRightFoot.y) < ConstInfo.jumpFootHeightDifferenceLimit
            && Mathf.Abs(lastPositionLeftFoot.x - Avatar.userPositionLeftFoot.x) < ConstInfo.jumpFootPositionVariationLimit
            && Mathf.Abs(lastPositionRightFoot.x - Avatar.userPositionRightFoot.x) < ConstInfo.jumpFootPositionVariationLimit;
        lastPositionLeftFoot = Avatar.userPositionLeftFoot;
        lastPositionRightFoot = Avatar.userPositionRightFoot;
    }

    void HandleFloorTileHighlight()
    {
        UnselectFloorTile();
        SelectFloorTile();
    }

    void UnselectFloorTile()
    {
        FloorTexture.setFloorTileTexture(leftFloorTile, FloorTexture.FloorTileUnSelected);
        FloorTexture.setFloorTileTexture(centerFloorTile, FloorTexture.FloorTileUnSelected);
        FloorTexture.setFloorTileTexture(rightFloorTile, FloorTexture.FloorTileUnSelected);
    }

    void SelectFloorTile()
    {
        if (GameManager.instance.GetKinectState())
        {
            if (avatarPosition < 107)
            {
                FloorTexture.setFloorTileTexture(leftFloorTile, FloorTexture.FloorTileSelected);
            }
            else if (avatarPosition > 121)
            {
                FloorTexture.setFloorTileTexture(rightFloorTile, FloorTexture.FloorTileSelected);

            }
            else
            {
                FloorTexture.setFloorTileTexture(centerFloorTile, FloorTexture.FloorTileSelected);

            }
        }
        else
        {
            if (Input.GetKeyDown(KeyCode.LeftArrow))
            {
                FloorTexture.setFloorTileTexture(leftFloorTile, FloorTexture.FloorTileSelected);
            }
            if (Input.GetKeyDown(KeyCode.DownArrow))
            {
                FloorTexture.setFloorTileTexture(centerFloorTile, FloorTexture.FloorTileSelected);
            }
            if (Input.GetKeyDown(KeyCode.RightArrow))
            {
                FloorTexture.setFloorTileTexture(rightFloorTile, FloorTexture.FloorTileSelected);
            }
        }
    }

    IEnumerator SceneLoad()
    {
        yield return new WaitForSeconds(3f);
        SceneManager.LoadScene("BattleScene");
    }
}

