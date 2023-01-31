using System.Collections;
using System.Collections.Generic;
using UnityEngine;

enum pmenuBtn
{
    resume = 0,
    restart = 1,
    quit = 2
}
public class PauseUI : MonoBehaviour
{
    public GameObject resumeBtn;
    public GameObject restartBtn;
    public GameObject quitBtn;
    pmenuBtn curBtn;
    public Sprite buttonSelected;
    public Sprite buttonUnselected;
    public AudioSource btnMove;


    // 현재 버튼을 맨 위의 게임 재개로 설정
    void Start()
    {
        curBtn = pmenuBtn.resume;
        Selected();
    }
    // Update is called once per frame
    void Update()
    {
    }
    void Selected()
    {
        Unselected();

        // 현재 버튼을 하이라이트
        switch (curBtn)
        {
            case pmenuBtn.resume:
                resumeBtn.GetComponent<UnityEngine.UI.Image>().sprite = buttonSelected;
                break;
            case pmenuBtn.restart:
                restartBtn.GetComponent<UnityEngine.UI.Image>().sprite = buttonSelected;
                break;
            case pmenuBtn.quit:
                quitBtn.GetComponent<UnityEngine.UI.Image>().sprite = buttonSelected;
                break;
        }

    }

    // 모든 버튼을 언하이라이트
    void Unselected()
    {
        resumeBtn.GetComponent<UnityEngine.UI.Image>().sprite = buttonUnselected;
        restartBtn.GetComponent<UnityEngine.UI.Image>().sprite = buttonUnselected;
        quitBtn.GetComponent<UnityEngine.UI.Image>().sprite = buttonUnselected;
    }

    // UI창에서의 입력을 핸들링
    public void MenuHandle()
    {
        // 윗방향키를 입력하면
        if (Input.GetKeyDown(KeyCode.UpArrow)||Floor.isUp)
        {
            btnMove.Play();

            Floor.isUp = false;
            // 현재 버튼이 게임 재개 아래쪽이면
            if (curBtn > pmenuBtn.resume)
                // 위로 하나씩 올림(게임 재개가 0번)
                curBtn--;
            // 현재 버튼이 게임 재개면
            else if (curBtn == pmenuBtn.resume)
                // 현재 버튼을 맨 아래 게임 종료 버튼으로 설정
                curBtn = pmenuBtn.quit;
            Selected();
        }

        // 아랫방향키를 입력하면
        else if (Input.GetKeyDown(KeyCode.DownArrow)||Floor.isDown)
        {
            btnMove.Play();

            Floor.isDown = false;
            // 현재 버튼이 게임 종료 위쪽이면
            if (curBtn < pmenuBtn.quit)
                // 아래로 하나씩 내림(게임 종료가 마지막)
                curBtn++;
            // 련재 버튼이 게임 종료면
            else if (curBtn == pmenuBtn.quit)
                // 현재 버튼을 맨 위 게임 재개 버튼으로 설정
                curBtn = pmenuBtn.resume;
            Selected();
        }

        // 엔터를 입력하면
        else if (Input.GetKeyDown(KeyCode.Return)||Floor.isEnter)
        {
            Floor.isEnter = false;
            // 게임 재개 버튼 선택시
            if (curBtn == pmenuBtn.resume)
                // 게임 상태를 게임으로 설정
                GameManager.instance.SetGameState(GameState.Game);
            // 다시 시작, 게임 종료 버튼 선택 시
            else
            {
                // 다시 시작 버튼 선택시
                if (curBtn == pmenuBtn.restart)
                {
                    // 게임 상태를 게임으로, 플레이어의 모든 변수들을 초기화
                    GameManager.instance.SetGameState(GameState.Game);
                    Player.instance.InitialAll();
                }
                // 종료 버튼 선택시
                else if (curBtn == pmenuBtn.quit)
                    // 게임 상태를 결과로
                    GameManager.instance.SetGameState(GameState.Result);
            }
            // 게임 상태가 변화했다고 설정
            GameManager.instance.SetStateChanged(true);
        }
    }

}
