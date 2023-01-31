using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ScreenUICanvas : MonoBehaviour
{
    public GameObject menu;
    public GameObject rank;
    public GameObject result;
    public GameObject setting;
    public GameObject pmenu;


    void Start()
    {
    }

    // Update is called once per frame
    void Update()
    {
    }

    // 메뉴 핸들링
    public void MenuHandle()
    {
        // 게임이 메뉴 상태이면
        if (GameManager.instance.GetGameState() == GameState.Menu)
        {
            // 메뉴 상태로 방금 전환되었으면 메뉴 UI를 켬
            if (GameManager.instance.GetStateChanged())
            {
                ActivateUI(menu);
                GameManager.instance.SetStateChanged(false);
            }
            // 메뉴 UI의 입력에 대한 이벤트 핸들
            menu.GetComponent<MenuUI>().MenuHandle();
        }

        // 게임이 랭크 상태이면
        else if (GameManager.instance.GetGameState() == GameState.Rank)
        {
            // 랭크 상태로 방금 전환되었으면 랭크 UI를 켬
            if (GameManager.instance.GetStateChanged())
            {
                ActivateUI(rank);
                GameManager.instance.SetStateChanged(false);
            }
            // 랭크 UI의 입력에 대한 이벤트 핸들
            rank.GetComponent<MyRankUI>().MenuHandle();
        }

        // 게임이 결과 상태이면
        else if (GameManager.instance.GetGameState() == GameState.Result)
        {
            // 결과 상태로 방금 전환되었으면 결과 UI를 켬
            if (GameManager.instance.GetStateChanged())
            {
                ResultUI.flag = true;
                ActivateUI(result);
                GameManager.instance.SetStateChanged(false);
            }

            // 결과 UI에 나타나는 정보 갱신
            result.GetComponent<ResultUI>().ShowResult();
        }

        // 게임이 세팅 상태이면
        else if (GameManager.instance.GetGameState() == GameState.Setting)
        {
            // 세팅 상태로 방금 전환되었으면 세팅 UI를 켬
            if (GameManager.instance.GetStateChanged())
            {
                ActivateUI(setting);
                GameManager.instance.SetStateChanged(false);
            }
            // 세팅 UI의 입력에 대한 이벤트 핸들
            setting.GetComponent<SettingUI>().MenuHandle();
        }

        // 게임이 퍼즈 상태이면
        else if (GameManager.instance.GetGameState() == GameState.Pause)
        {
            // 퍼즈 상태로 방금 전환되었으면 퍼즈 UI를 켬
            if (GameManager.instance.GetStateChanged())
            {
                ActivateUI(pmenu);
                GameManager.instance.SetStateChanged(false);
            }
            // 퍼즈 UI의 입력에 대한 이벤트 핸들
            pmenu.GetComponent<PauseUI>().MenuHandle();
        }

        // 게임이 게임, 배틀, 종료 상태이면
        else
        {
            // 방금 전환되었으면 모든 UI를 끔
            if (GameManager.instance.GetStateChanged())
            {
                DeactivateAllUI();
                GameManager.instance.SetStateChanged(false);
            }
        }
    }

    // UI 오브젝트를 파라미터로 받아서 켬
    void ActivateUI(GameObject obj)
    {
        DeactivateAllUI();
        obj.SetActive(true);
    }

    // 모든 UI 오브젝트를 끔
    void DeactivateAllUI()
    {
        menu.SetActive(false);
        rank.SetActive(false);
        result.SetActive(false);
        setting.SetActive(false);
        pmenu.SetActive(false);
    }
}
