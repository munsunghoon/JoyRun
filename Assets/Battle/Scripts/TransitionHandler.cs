using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;


public class TransitionHandler : MonoBehaviour
{
    //TODO: 전환될 화면 인덱스
    public int sceneIndex;
    Animator animator;
    public float time;
    public GameObject Nodes;

    // Start is called before the first frame update
    void Start()
    {
        GameManager.instance.SetGameState(GameState.Battle);
        animator = transform.GetComponent<Animator>();
    }
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape) || Floor.isPause)
        {
            GameManager.instance.SetStateChanged(true);

            if (GameManager.instance.GetGameState() == GameState.Battle)
            {
                Time.timeScale = 0;
                GameManager.instance.SetGameState(GameState.Pause);
            }
            Floor.isPause = false;
        }
 

        //change scene when user presses Space key
        if (HealthBarHandler.GetHealthBarValue() == 0)
        {
            GameManager.instance.SetStateChanged(true);

            Nodes.SetActive(false);
            StartCoroutine(LoadSceneAFterTransition());
        }
        if (PlayerHealthbarHandler.GetHealthBarValue() == 0)
        {
            GameManager.instance.SetStateChanged(true);
            Nodes.SetActive(false);
            GameManager.instance.SetGameState(GameState.Result);
        }
    }
    private IEnumerator LoadSceneAFterTransition()
    {
        yield return new WaitForSeconds(5f);
        animator.SetBool("animateOut", true);
        StartCoroutine(SceneChage());
    }
    private IEnumerator SceneChage()
    {
        yield return new WaitForSeconds(1f);
        if (PlayerHealthbarHandler.GetHealthBarValue() > 0)
        {
            float plusTime = PlayerHealthbarHandler.GetHealthBarValue() * 20;
            time = PlayerPrefs.GetFloat("time");
            PlayerPrefs.SetFloat("time", time + plusTime);
            PlayerPrefs.SetFloat("playtime", PlayerPrefs.GetFloat("playtime") + plusTime);
        }
        else
        {
            float leftTime = PlayerPrefs.GetFloat("time");
            PlayerPrefs.SetFloat("time", 0);
            PlayerPrefs.SetFloat("playtime", PlayerPrefs.GetFloat("playtime") - leftTime);
        }
        GameManager.instance.SetGameState(GameState.Game);
        SceneManager.LoadScene(sceneIndex);
    }

}
