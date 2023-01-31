using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ScreenCanvas : MonoBehaviour
{
    public GameObject result;
    public GameObject pause;


    // Start is called before the first frame update
    void Start()
    {
        result.SetActive(false);
        pause.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        if (GameManager.instance.GetGameState() == GameState.Result)
        {
            result.SetActive(true);
            result.GetComponent<ResultUI>().ShowBattleResult();

        }
        else if (GameManager.instance.GetGameState() == GameState.Pause)
        {
            // 퍼즈 상태로 방금 전환되었으면 퍼즈 UI를 켬

            pause.SetActive(true);

            // 퍼즈 UI의 입력에 대한 이벤트 핸들
            pause.GetComponent<BattlePauseUI>().MenuHandle();
        }
        if (GameManager.instance.GetGameState() == GameState.Battle)
        {
            pause.SetActive(false);
        }
    }

}
