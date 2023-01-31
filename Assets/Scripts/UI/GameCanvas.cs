using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GameCanvas : MonoBehaviour
{
    public Text Combo;
    public Text CountDownTimer;
    public Text SpeedText;
    public Text TimerText;
    public Text HpText;
    public GameObject TimeIncreaseText;
    public GameObject HpIncreaseText;
    public GameObject HpDecreaseText;
    // Start is called before the first frame update
    void Start()
    {
        TimeIncreaseText.SetActive(false);
        HpIncreaseText.SetActive(false);
        HpDecreaseText.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    public void DisplaySpeed()
    {
        SpeedText.text = (Mathf.Floor((Player.instance.speed / 1.6f) * 100) / 100).ToString() + "Km/h";
    }
    // 남은 시간 출력(소수점 첫 번째까지)
    public void DisplayTime()
    {
        TimerText.text = (Mathf.Floor(Player.instance.time*10)*0.1f).ToString();
    }
    // 풍선 히트 시 호출, 시간 증가 문구 출력, 일정 시간 후 사라짐
    public void DisplayTimeIncrease()
    {
        TimeIncreaseText.SetActive(true);
        StartCoroutine(InvisibleObject(TimeIncreaseText));
    }
    // 체력 출력
    public void DisplayHp()
    {
        HpText.text = Player.instance.hp.ToString() + "/" + Player.instance.maxHp.ToString();
    }
    // 하트 획득 시 호출, 체력 증가 문구 출력, 일정 시간 후 사라짐
    public void DisplayHpIncrease()
    {
        HpIncreaseText.SetActive(true);
        StartCoroutine(InvisibleObject(HpIncreaseText));
    }
    // 장애물 충돌 시 호출, 체력 감소 문구 출력, 일정 시간 후 사라짐
    public void DisplayHpDecrease()
    {
        HpDecreaseText.SetActive(true);
        StartCoroutine(InvisibleObject(HpDecreaseText));
    }
    // 현재 콤보 출력
    public void DisplayCombo()
    {
        Combo.gameObject.SetActive(true);
        Combo.text = Player.instance.combo.ToString() + " Combo";
        StartCoroutine(InvisibleObject(Combo.gameObject));
    }
    // ConstInfo에 저장된 시간이 지난 뒤 안내 문구 비활성화
    IEnumerator InvisibleObject(GameObject text)
    {
        yield return new WaitForSeconds(ConstInfo.displayTimer);
        text.SetActive(false);
    }
}
