using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using static UnityEngine.LowLevel.PlayerLoop;


public enum GameState : int
{
    Menu = 1,
    Setting = 2,
    Rank = 3,
    Game = 4,
    Pause = 5,
    Result = 6,
    Battle = 7,
    Quit = 8
}

public class GameManager : MonoBehaviour
{
    // 인스턴스, 게임상태, 키넥트 연결 상태 변수 선언
    public static GameManager instance;
    private GameState curGameState;
    private bool kinectState;

    public static string rankpath = "Assets/Resources/rankdb.txt";
    Player player;
    ScreenUICanvas ui;
    bool stateChanged;
    public GameObject curTile;
    public GameObject nextTile;

    void Awake()
    {
        if (!instance)
        {
            instance = this;
        }
        else
            Destroy(gameObject);
    }

    void Start()
    {
        // 디스플레이 설정, 키넥트는 없다고 가정한 상태, 게임은 초기 메뉴 상태
        DisplaySetting();
        kinectState = false;
        curGameState = GameState.Menu;
        stateChanged = true;
        player = GameObject.Find("Player").GetComponent<Player>();
        ui = GameObject.Find("ScreenUICanvas").GetComponent<ScreenUICanvas>();
    }

    void Update()
    {
        // 게임 중에 esc 누르면
        if (Input.GetKeyDown(KeyCode.Escape) || Floor.isPause && curGameState == GameState.Game)
        {
            Floor.isPause = false;
            // 일시정지 상태로 변경
            curGameState = GameState.Pause;
            stateChanged = true;
        }
        // 종료 상태이면
        if (curGameState == GameState.Quit)
        {
            // 모든 변수 초기화 후 종료
            player.InitialAll();
            Quit();
        }
        // 메뉴 핸들링
        ui.MenuHandle();
    }

    // 화면 설정 (디스플레이가 하나일 경우 전면 UI만 출력, 두개 이상일 경우 바닥 UI 출력)
    public void DisplaySetting()
    {
        if (Display.displays.Length > 1)
            Display.displays[1].Activate();
        if (Display.displays.Length > 2)
            Display.displays[2].Activate();
    }

    // 키넥트 연결 여부 변수 Getter & Setter
    public bool GetKinectState() { return kinectState; }
    public void SetKinectState(bool newKinectState) { kinectState = newKinectState; }



    // 게임상태 변수 Getter & Setter
    public GameState GetGameState() { return curGameState; }
    public void SetGameState(GameState newGameState) { curGameState = newGameState; }

    // 게임상태가 이전과 비교해 변화했는지 판단하는 변수 Getter & Setter
    public bool GetStateChanged() { return stateChanged; }
    public void SetStateChanged(bool changed) { stateChanged = changed; }


    public void Quit()
    {
#if UNITY_EDITOR
                UnityEditor.EditorApplication.isPlaying = false;
#else
        Application.Quit();
#endif
    }
}