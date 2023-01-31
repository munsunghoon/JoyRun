using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum BattlePlayerLocation : int
{
    Left = -1,
    Center = 0,
    Right = 1
}
public class PlayerAnim : MonoBehaviour
{
    public static PlayerAnim instance;

    Animator animator;

    public float hp;
    public float monsterHp;

    public float timer = 0;

    public static bool jump;
    public static bool kick;
    public static bool punch;

    // 바닥 UI 타일
    public GameObject leftFloorTile;
    public GameObject centerFloorTile;
    public GameObject rightFloorTile;

    // 행동 관련 번수 선언
    public static Vector3 lastPositionLeftFoot;
    public static Vector3 lastPositionRightFoot;
    public static Vector3 lastPositionHead;

    public BattlePlayerLocation curLocation;
    BattleHighlight highlightTiles;

    //Kinect
    public bool kinectState;
    public float avatarPosition;


    void Awake() { instance = this; }
    // Start is called before the first frame update
    void Start()
    {
        animator = GetComponent<Animator>();
        jump = false;
        kick = false;
        punch = false;

        avatarPosition = 0;
        kinectState = false;
        curLocation = BattlePlayerLocation.Center;
        highlightTiles = GameObject.Find("HighlightTiles").GetComponent<BattleHighlight>();

        lastPositionLeftFoot = Vector3.zero;
        lastPositionRightFoot = Vector3.zero;
        lastPositionHead = Vector3.zero;


    }

    // Update is called once per frame
    void Update()
    {
        hp = (float)PlayerHealthbarHandler.GetHealthBarValue() * 100;
        monsterHp = (float)HealthBarHandler.GetHealthBarValue() * 100;

        kinectState = GameManager.instance.GetKinectState();
        avatarPosition = (Avatar.userPosition.x * ((ConstInfo.lineWidth * 3) / 1920) + ConstInfo.tileX);

        HandleGame(hp, monsterHp);


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
        if (kinectState)
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
    void HandleGame(float hp, float monsterHp)
    {
        if (monsterHp == 0)
        {
            animator.SetBool("victory", true);
        }
        else if (hp == 0)
        {
            animator.SetBool("defeat", true);

        }
        else
            HandlePlayer();
    }
    void HandlePlayer()
    {
        if (kinectState)
        {
            Debug.Log(avatarPosition);
            HandlePlayerKinect();
        }
        else
        {
            HandlePlayerPosition();
            HandlePlayerAction();
        }

    }
    void HandlePlayerKinect()
    {
        if (avatarPosition < 107)
        {
            Debug.Log("Left");

            HandlePlayerLocation(BattlePlayerLocation.Left);
            HandleFloorTileHighlight();
        }
        else if (avatarPosition > 121)
        {
            Debug.Log("Right");
            HandlePlayerLocation(BattlePlayerLocation.Right);
            HandleFloorTileHighlight();

        }
        else
        {
            Debug.Log("Center");
            HandlePlayerLocation(BattlePlayerLocation.Center);
            HandleFloorTileHighlight();

        }
        if (Avatar.userPositionLeftHand.z > Avatar.userPositionHead.z + Avatar.distanceHandElbow * 5 / 3)
        {
            animator.SetTrigger("leftPunch");
            punch = true;
            StartCoroutine(HandleAttackTimer());
        }
        if (Avatar.userPositionRightHand.z > Avatar.userPositionHead.z + Avatar.distanceHandElbow * 5 / 3)
        {
            animator.SetTrigger("rightPunch");
            punch = true;
            StartCoroutine(HandleAttackTimer());

        }

        //Right kick
        if (Avatar.userPositionRightFoot.z > Avatar.userPositionHead.z + Avatar.distanceFootKnee * 5 / 3)
        {
            animator.SetTrigger("kickRight");
            kick = true;
            StartCoroutine(HandleAttackTimer());

        }
        //left kick
        if (Avatar.userPositionLeftFoot.z > Avatar.userPositionHead.z + Avatar.distanceFootKnee * 5 / 3)
        {
            animator.SetTrigger("kickLeft");
            kick = true;
            StartCoroutine(HandleAttackTimer());
        }

        //jump
        if (lastPositionLeftFoot.y + ConstInfo.jumpHeight < Avatar.userPositionLeftFoot.y
            && lastPositionRightFoot.y + ConstInfo.jumpHeight < Avatar.userPositionRightFoot.y
            && lastPositionHead.y + ConstInfo.jumpHeight < Avatar.userPositionHead.y
            && lastPositionLeftFoot.y != 0 && lastPositionRightFoot.y != 0
            && Mathf.Abs(lastPositionLeftFoot.y - lastPositionRightFoot.y) < ConstInfo.jumpFootHeightDifferenceLimit
            && Mathf.Abs(lastPositionLeftFoot.x - Avatar.userPositionLeftFoot.x) < ConstInfo.jumpFootPositionVariationLimit
            && Mathf.Abs(lastPositionRightFoot.x - Avatar.userPositionRightFoot.x) < ConstInfo.jumpFootPositionVariationLimit)
        {
            animator.SetTrigger("jump");
            jump = true;
            StartCoroutine(HandleJumpTimer());
        }

        lastPositionLeftFoot = Avatar.userPositionLeftFoot;
        lastPositionRightFoot = Avatar.userPositionRightFoot;
    }
    void HandlePlayerPosition()
    {
        if (Input.GetKeyDown(KeyCode.LeftArrow))
        {
            HandlePlayerLocation(BattlePlayerLocation.Left);
            HandleFloorTileHighlight();
        }
        if (Input.GetKeyDown(KeyCode.DownArrow))
        {
            HandlePlayerLocation(BattlePlayerLocation.Center);
            HandleFloorTileHighlight();
        }
        if (Input.GetKeyDown(KeyCode.RightArrow))
        {
            HandlePlayerLocation(BattlePlayerLocation.Right);
            HandleFloorTileHighlight();
        }

    }
    public void HandlePlayerLocation(BattlePlayerLocation MovedLocation)
    {
        if (MovedLocation == BattlePlayerLocation.Left)
        {
            curLocation = BattlePlayerLocation.Left;
            transform.position = new Vector3(100, transform.position.y, transform.position.z);
        }
        else if (MovedLocation == BattlePlayerLocation.Center)
        {
            curLocation = BattlePlayerLocation.Center;
            transform.position = new Vector3(114, transform.position.y, transform.position.z);
        }
        else
        {
            curLocation = BattlePlayerLocation.Right;
            transform.position = new Vector3(128, transform.position.y, transform.position.z);
        }
        highlightTiles.Highlight(curLocation);

    }
    void HandlePlayerAction()
    {
        if (Input.GetKeyDown(KeyCode.Return))
        {
            animator.SetTrigger("kickRight");
            kick = true;
            StartCoroutine(HandleAttackTimer());
        }


        if (Input.GetKeyDown(KeyCode.LeftShift))
        {
            animator.SetTrigger("rightPunch");
            punch = true;
            StartCoroutine(HandleAttackTimer());
        }


        if (Input.GetKeyDown(KeyCode.LeftAlt))
        {
            animator.SetTrigger("jump");
            jump = true;
            StartCoroutine(HandleJumpTimer());

        }

    }

    private IEnumerator HandleAttackTimer()
    {
        yield return new WaitForSeconds(.5f);
        animator.ResetTrigger("leftPunch");
        animator.ResetTrigger("rightPunch");
        animator.ResetTrigger("kickRight");
        animator.ResetTrigger("kickLeft");
        kick = false;
        punch = false;

    }
    private IEnumerator HandleJumpTimer()
    {
        yield return new WaitForSeconds(2f);
        jump = false;
    }
    public static bool GetPunchState()
    {
        if (punch == true) return true;
        else return false;
    }
    public static bool GetKickState()
    {
        if (kick == true) return true;
        else return false;
    }
    public static bool GetPlayerState()
    {
        if (kick == true || punch == true)
        {
            return true;
        }
        else
            return false;

    }
    public static bool GetPlayerJumpState()
    {
        if (jump == true)
        {
            return true;
        }
        else
            return false;
    }
    //kick 발동시, 1/10 확률로 즉사
    public static bool KillMonster()
    {
        if (kick == true)
        {
            int random = Random.Range(1, 11);
            if (random == 1)
            {
                Debug.Log("KIIILLLLLl");
                return true;
            }
            else
                return false;
        }
        else
            return false;

    }

}