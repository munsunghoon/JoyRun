using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Floor : MonoBehaviour
{
    //button
    public GameObject leftMarker;
    public GameObject rightMarker;
    public GameObject enterButton;
    public GameObject pauseButton;
    public GameObject rightButton;
    public GameObject leftButton;
    public GameObject upButton;
    public GameObject downButton;
    public GameObject centerButton;
    public GameObject pauseText;
    public GameObject timerBox;
    public GameObject barHpBox;

    private Vector3 handlePositionLeftFoot;
    private Vector3 handlePositionRightFoot;
    private float timeTimer;
    private bool press;
    //게임정보
    public Text timer;
    public Text hp;
    public Text pauseMenu;

    public static bool isCenter;
    public static bool isUp;
    public static bool isDown;
    public static bool isRight;
    public static bool isLeft;
    public static bool isPause;
    public static bool isEnter;
    public static bool isGame;
    private bool leftPress, rightPress;
    // Start is called before the first frame update
    void Start()
    {
        isUp = false;
        isDown = false;
        isRight = false;
        isLeft = false;
        isPause = false;
        isEnter = false;

        isGame = false;
        isCenter = false;

        timeTimer = 0;
        press = false;

        leftPress = false;
        rightPress = false;
    }

    // Update is called once per frame
    void Update()
    {
        HandleMenu();
        if (GameManager.instance.GetKinectState())
        {
            MarkerMove();
            HandleMenu();

            if (isCenter)
                HandleKinectClick();
            else if (!isCenter && isGame)
                HandleKinectPause();
            else
                HandleCenter();
        }
        //현재 시간을 floor canvas 에 보여줌
        timer.text = (Mathf.Floor(Player.instance.time * 10) * 0.1f).ToString();
        //현재 체력을 floor canvas 에 보여줌
        hp.text = Player.instance.hp.ToString() + "/" + Player.instance.maxHp.ToString();
    }
    

    //바닥에 표시되는 버튼을 상황에따라 다르게 출력
    void HandleMenu()
    {
        
        //메뉴일때 발판
        if (GameManager.instance.GetGameState() == GameState.Menu)
        {
            centerButton.SetActive(true);
            rightMarker.SetActive(true);
            leftMarker.SetActive(true);
            enterButton.SetActive(true);
            upButton.SetActive(true);
            downButton.SetActive(true);
            pauseButton.SetActive(false);
            rightButton.SetActive(false);
            leftButton.SetActive(false);
            pauseText.SetActive(false);
            isGame = false;
        }
        //환경설정 발판
        else if (GameManager.instance.GetGameState() == GameState.Setting)
        {
            centerButton.SetActive(true);
            rightMarker.SetActive(true);
            leftMarker.SetActive(true);
            enterButton.SetActive(true);
            upButton.SetActive(true);
            downButton.SetActive(true);
            pauseButton.SetActive(false);
            rightButton.SetActive(true);
            leftButton.SetActive(true);
            pauseText.SetActive(false);

            isGame = false;
            pauseMenu.text = "뒤로가기";
        }
        //일시정지 발판
        else if (GameManager.instance.GetGameState() == GameState.Pause)
        {
            centerButton.SetActive(true);
            rightMarker.SetActive(true);
            leftMarker.SetActive(true);
            enterButton.SetActive(true);
            upButton.SetActive(true);
            downButton.SetActive(true);
            pauseButton.SetActive(false);
            rightButton.SetActive(false);
            leftButton.SetActive(false);
            pauseText.SetActive(true);
            isGame = false;
            
        }
        //게임중이거나 배틀중일때 발판
        else if ((GameManager.instance.GetGameState() == GameState.Game) || (GameManager.instance.GetGameState() == GameState.Battle))
        {
            centerButton.SetActive(false);
            rightMarker.SetActive(false);
            leftMarker.SetActive(false);
            enterButton.SetActive(false);
            upButton.SetActive(false);
            downButton.SetActive(false);
            pauseButton.SetActive(true);
            rightButton.SetActive(false);
            leftButton.SetActive(false);
            pauseText.SetActive(false);

            isGame = true;
            isCenter = false;
            pauseMenu.text = "일시정지";
            if (GameManager.instance.GetGameState() == GameState.Battle)
            {
                timerBox.SetActive(false);
                barHpBox.SetActive(false);
            }
            else if (GameManager.instance.GetGameState() == GameState.Game)
            {
                timerBox.SetActive(true);
                barHpBox.SetActive(true);
            }
            
        }
        //결과화면 시 발판
        else if ((GameManager.instance.GetGameState() == GameState.Result))
        {
            centerButton.SetActive(true);
            rightMarker.SetActive(true);
            leftMarker.SetActive(true);
            enterButton.SetActive(false);
            upButton.SetActive(false);
            downButton.SetActive(false);
            pauseButton.SetActive(false);
            rightButton.SetActive(true);
            leftButton.SetActive(false);
            pauseText.SetActive(false);
            isGame = false;

        }
        //랭킹화면 발판
        else if ((GameManager.instance.GetGameState() == GameState.Rank))
        {
            centerButton.SetActive(true);
            rightMarker.SetActive(true);
            leftMarker.SetActive(true);
            enterButton.SetActive(true);
            upButton.SetActive(false);
            downButton.SetActive(false);
            pauseButton.SetActive(false);
            rightButton.SetActive(false);
            leftButton.SetActive(false);
            pauseText.SetActive(false);
        }
    }
    //오른발 왼발을 쫓아다니는 원 생성
    //왼발    : 빨간 원
    //오른발   : 파란 원
    void MarkerMove()
    {
        leftMarker.transform.localPosition = new Vector3(Avatar.userPositionLeftFoot.x, Avatar.userPositionLeftFoot.z, 0);
        rightMarker.transform.localPosition = new Vector3(Avatar.userPositionRightFoot.x, Avatar.userPositionRightFoot.z, 0);
    }
    //중앙 발판 버튼을 밟아야 다른 버튼을 누를 수 있음
    void HandleCenter()
    {
        if ((Vector2.Distance(new Vector2(centerButton.transform.localPosition.x, centerButton.transform.localPosition.y),
            new Vector2(Avatar.userPositionRightFoot.x, Avatar.userPositionRightFoot.z)) < 140) &&
                (Vector2.Distance(new Vector2(centerButton.transform.localPosition.x, centerButton.transform.localPosition.y),
                new Vector2(Avatar.userPositionLeftFoot.x, Avatar.userPositionLeftFoot.z)) < 140))
            isCenter = true;
    }
    //왼발 오른발 여부(바닥 버튼 터치용)
    void HandleRightLeft()
    {
        if (Avatar.userPositionLeftFoot.y > ConstInfo.stepHeight - 30 && Avatar.userPositionRightFoot.y < ConstInfo.stepHeight - 15)
            leftPress = true;
        else if (Avatar.userPositionRightFoot.y > ConstInfo.stepHeight - 30 && Avatar.userPositionLeftFoot.y < ConstInfo.stepHeight - 15)
            rightPress = true;
    }
    //바닥 타일 버튼 인식
    void HandleKinectClick()
    {
        if(!leftPress&&!rightPress)
            HandleRightLeft();
        //키보드 아래 화살표 키와 동일
        if (((Vector2.Distance(new Vector2(downButton.transform.localPosition.x, downButton.transform.localPosition.y),
            new Vector2(Avatar.userPositionRightFoot.x, Avatar.userPositionRightFoot.z)) < 107) && rightPress)
            && (GameManager.instance.GetGameState() != GameState.Game) && (GameManager.instance.GetGameState() != GameState.Battle)
            &&(Avatar.userPositionRightFoot.y < 72))
        {
            isDown = true;
            rightPress = false;
        }
        //키보드 위 화살표 키와 동일
        else if (((Vector2.Distance(new Vector2(upButton.transform.localPosition.x, upButton.transform.localPosition.y),
            new Vector2(Avatar.userPositionLeftFoot.x, Avatar.userPositionLeftFoot.z)) < 107) && leftPress)
            && (GameManager.instance.GetGameState() != GameState.Game) && (GameManager.instance.GetGameState() != GameState.Battle)
            && (Avatar.userPositionLeftFoot.y < 72))
        {
            isUp = true;
            leftPress = false;
        }
        //키보드 오른쪽 화살표 키와 동일 
        else if ((Vector2.Distance(new Vector2(rightButton.transform.localPosition.x, rightButton.transform.localPosition.y),
            new Vector2(Avatar.userPositionRightFoot.x, Avatar.userPositionRightFoot.z)) < 107 && rightPress)
            && (GameManager.instance.GetGameState() == GameState.Setting||GameManager.instance.GetGameState() == GameState.Result)
            && (Avatar.userPositionRightFoot.y < 72))
        {
            isRight = true;
            rightPress = false;
        }
        //키보드 왼쪽 화살표 키와 동일
        else if ((Vector2.Distance(new Vector2(leftButton.transform.localPosition.x, leftButton.transform.localPosition.y),
            new Vector2(Avatar.userPositionLeftFoot.x, Avatar.userPositionLeftFoot.z)) < 107 && leftPress)
            && GameManager.instance.GetGameState() == GameState.Setting
            && (Avatar.userPositionLeftFoot.y < 72))
        {
            isLeft = true;
            leftPress = false;
            
        }
        //키보드 엔터 키와 동일
        else if ((((Avatar.userPositionLeftFoot.x > enterButton.transform.localPosition.x - 158 && Avatar.userPositionLeftFoot.x < enterButton.transform.localPosition.x + 158) &&
            (Avatar.userPositionLeftFoot.z > enterButton.transform.localPosition.y - 61 && Avatar.userPositionLeftFoot.z < enterButton.transform.localPosition.y + 61))&&leftPress
            && (Avatar.userPositionLeftFoot.y < 72) ||
            ((Avatar.userPositionRightFoot.x > enterButton.transform.localPosition.x - 158 && Avatar.userPositionRightFoot.x < enterButton.transform.localPosition.x + 158) &&
            (Avatar.userPositionRightFoot.z > enterButton.transform.localPosition.y - 61 && Avatar.userPositionRightFoot.z < enterButton.transform.localPosition.y + 61)) && rightPress
            && (Avatar.userPositionRightFoot.y < 72))
            && (GameManager.instance.GetGameState() != GameState.Game) && (GameManager.instance.GetGameState() != GameState.Battle))
        {
            isEnter = true;
            leftPress = false;
            rightPress = false;
        }
        //게임 상 일시정지 기능
        else if ((Vector2.Distance(new Vector2(pauseButton.transform.localPosition.x, pauseButton.transform.localPosition.y),
            new Vector2(Avatar.userPositionRightFoot.x, Avatar.userPositionRightFoot.z)) < 76) && rightPress
            && (Avatar.userPositionRightFoot.y < 72))
        {
            isPause = true;
            rightPress = false;
        }
    }
    //게임상 일시정지 기능과 동일한 함수
    //Update() 에서 보기 편하게 하기 위해 만듬
    void HandleKinectPause()
    {
        if ((Vector2.Distance(new Vector2(pauseButton.transform.localPosition.x, pauseButton.transform.localPosition.y),
            new Vector2(Avatar.userPositionRightFoot.x, Avatar.userPositionRightFoot.z)) < 76) && rightPress)
        {
            isPause = true;
            rightPress = false;
        }
    }
}

