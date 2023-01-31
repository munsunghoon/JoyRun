using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HandleDamage : MonoBehaviour
{
    GameObject player;
    GameObject monster;

    public bool monsterAttack;
    public bool playerAttack;
    public Canvas blood;

    Animator animator;
    Animator anim;

    public float timer = 0;
    public float nodeTimer = 0;

    public GameObject camera;

    public GameObject leftPunch;
    public GameObject rightPunch;
    public GameObject leftKick;
    public GameObject rightKick;

    public GameObject punchNode;
    public GameObject kickNode;
    public GameObject canvas;

    public float punchTime;
    public float kickTime;


    public GameObject perfectText;
    public GameObject greatText;
    public GameObject goodText;
    public GameObject missText;

    public GameObject playerBox;
    public GameObject monsterBox;


    // Start is called before the first frame update
    void Start()
    {
        player = GameObject.Find("player");
        monster = GameObject.Find("ScareCrow01");
        blood.gameObject.SetActive(false);


        monsterAttack = false;
        playerAttack = false;

        animator = player.GetComponent<Animator>();
        anim = monster.GetComponent<Animator>();

        leftPunch.SetActive(false);
        rightPunch.SetActive(false);
        leftKick.SetActive(false);
        rightKick.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        monsterAttack = MonsterAnim.GetMonsterState();
        playerAttack = PlayerAnim.GetPlayerState();
        timer += Time.deltaTime;
        nodeTimer += Time.deltaTime;

        punchTime = punchNode.GetComponent<RectTransform>().rect.width;
        kickTime = kickNode.GetComponent<RectTransform>().rect.width;


        if (timer > 1)
        {
            AttackHandler();

        }
        if (nodeTimer > 5f)
        {
            ShowNode();
        }
    }
    public bool ComparePosition()
    {
        if (player.transform.position.x == monster.transform.position.x)
            return true;
        else
            return false;
    }
    void AttackHandler()
    {

        if (monsterAttack)
        {
            if (ComparePosition())
            {
                Debug.Log("Monster Attack!");
                animator.SetTrigger("hit");
                StartCoroutine(EffectHanlder());
                playerBox.GetComponent<Animator>().SetTrigger("size");
                PlayerHealthbarHandler.SetHealthBarValue(PlayerHealthbarHandler.GetHealthBarValue() - (0.1f * 100/ConstInfo.monsterHp));
                StartCoroutine(HandleHitAnim());
            }

            timer = 0;
        }
        if (playerAttack)
        {
            if (ComparePosition())
            {

                //기본공격
                if (PlayerAnim.GetPunchState() == true)
                {
                    if (leftPunch.activeSelf || rightPunch.activeSelf)
                    {

                        if (punchTime <= 210)
                        {
                            monsterBox.GetComponent<Animator>().SetTrigger("size");
                            HealthBarHandler.SetHealthBarValue(HealthBarHandler.GetHealthBarValue() - (0.1f * 100 / ConstInfo.monsterHp));
                            HealthBarHandler.SetHealthBarValue(HealthBarHandler.GetHealthBarValue() - (0.1f * 100 / ConstInfo.monsterHp));
                            anim.SetTrigger("damaged");
                            GameObject text = Instantiate(perfectText, new Vector3(0, 0, 0), Quaternion.identity) as GameObject;
                            text.transform.SetParent(GameObject.FindGameObjectWithTag("Canvas").transform, false);


                        }
                        else if (210 < punchTime && punchTime <= 250)
                        {
                            monsterBox.GetComponent<Animator>().SetTrigger("size");
                            HealthBarHandler.SetHealthBarValue(HealthBarHandler.GetHealthBarValue() - (0.1f * 100 / ConstInfo.monsterHp));
                            anim.SetTrigger("damaged");
                            GameObject text = Instantiate(greatText, new Vector3(0, 0, 0), Quaternion.identity) as GameObject;
                            text.transform.SetParent(GameObject.FindGameObjectWithTag("Canvas").transform, false);


                        }
                        else if (250 < punchTime && punchTime <= 350)
                        {
                            monsterBox.GetComponent<Animator>().SetTrigger("size");
                            HealthBarHandler.SetHealthBarValue(HealthBarHandler.GetHealthBarValue() - (0.05f * 100 / ConstInfo.monsterHp));
                            anim.SetTrigger("damaged");
                            GameObject text = Instantiate(goodText, new Vector3(0, 0, 0), Quaternion.identity) as GameObject;
                            text.transform.SetParent(GameObject.FindGameObjectWithTag("Canvas").transform, false);
                        }
                        else if (punchTime > 350)
                        {
                            GameObject text = Instantiate(missText, new Vector3(0, 0, 0), Quaternion.identity) as GameObject;
                            text.transform.SetParent(GameObject.FindGameObjectWithTag("Canvas").transform, false);
                        }
                    }


                }
                //회전공격
                if (PlayerAnim.GetKickState() == true)
                {
                    if (leftKick.activeSelf || rightKick.activeSelf)
                    {

                        if (PlayerAnim.KillMonster() == true)
                        {
                            monsterBox.GetComponent<Animator>().SetTrigger("size");
                            GameObject text = Instantiate(perfectText, new Vector3(0, 0, 0), Quaternion.identity) as GameObject;
                            text.transform.SetParent(GameObject.FindGameObjectWithTag("Canvas").transform, false);
                            HealthBarHandler.SetHealthBarValue(0);
                        }
                        else
                        {

                            if (kickTime <= 210)
                            {
                                monsterBox.GetComponent<Animator>().SetTrigger("size");
                                HealthBarHandler.SetHealthBarValue(HealthBarHandler.GetHealthBarValue() - (0.1f * 100 / ConstInfo.monsterHp));
                                HealthBarHandler.SetHealthBarValue(HealthBarHandler.GetHealthBarValue() - (0.1f * 100 / ConstInfo.monsterHp));
                                anim.SetTrigger("damaged");
                                GameObject text = Instantiate(perfectText, new Vector3(0, 0, 0), Quaternion.identity) as GameObject;
                                text.transform.SetParent(GameObject.FindGameObjectWithTag("Canvas").transform, false);
                            }
                            else if (210 < kickTime && kickTime <= 250)
                            {
                                monsterBox.GetComponent<Animator>().SetTrigger("size");
                                HealthBarHandler.SetHealthBarValue(HealthBarHandler.GetHealthBarValue() - (0.1f * 100 / ConstInfo.monsterHp));
                                anim.SetTrigger("damaged");
                                GameObject text = Instantiate(greatText, new Vector3(0, 0, 0), Quaternion.identity) as GameObject;
                                text.transform.SetParent(GameObject.FindGameObjectWithTag("Canvas").transform, false);

                            }
                            else if (250 < kickTime && kickTime <= 350)
                            {
                                monsterBox.GetComponent<Animator>().SetTrigger("size");
                                HealthBarHandler.SetHealthBarValue(HealthBarHandler.GetHealthBarValue() - (0.05f * 100 / ConstInfo.monsterHp));
                                anim.SetTrigger("damaged");
                                GameObject text = Instantiate(goodText, new Vector3(0, 0, 0), Quaternion.identity) as GameObject;
                                text.transform.SetParent(GameObject.FindGameObjectWithTag("Canvas").transform, false);
                            }
                            else if (kickTime > 350)
                            {
                                GameObject text = Instantiate(missText, new Vector3(0, 0, 0), Quaternion.identity) as GameObject;
                                text.transform.SetParent(GameObject.FindGameObjectWithTag("Canvas").transform, false);
                            }
                        }


                    }


                }
            }
            StartCoroutine(HandleHitAnim());
            timer = 0;
        }
    }
    private IEnumerator HandleHitAnim()
    {
        yield return new WaitForSeconds(1f);
        animator.ResetTrigger("hit");
        anim.ResetTrigger("damaged");
    }
    private IEnumerator EffectHanlder()
    {
        blood.gameObject.SetActive(true);
        camera.GetComponent<ShakeBehavior>().TriggerShake();
        yield return new WaitForSeconds(2f);
        blood.gameObject.SetActive(false);
    }

    void ShowNode()
    {

        int rn = Random.Range(1, 5);
        switch (rn)
        {
            case 1:
                leftPunch.SetActive(true);
                rightPunch.SetActive(false);
                leftKick.SetActive(false);
                rightKick.SetActive(false);
                break;
            case 2:
                leftPunch.SetActive(false);
                rightPunch.SetActive(false);
                leftKick.SetActive(true);
                rightKick.SetActive(false);
                break;
            case 3:
                leftPunch.SetActive(false);
                rightPunch.SetActive(false);
                leftKick.SetActive(false);
                rightKick.SetActive(true);
                break;
            default:
                leftPunch.SetActive(false);
                rightPunch.SetActive(true);
                leftKick.SetActive(false);
                rightKick.SetActive(false);
                break;

        }

        StartCoroutine(DeleteAllNode());
        nodeTimer -= 3.5f;



    }

    IEnumerator DeleteAllNode()
    {
        yield return new WaitForSeconds(2f);
        leftPunch.SetActive(false);
        rightPunch.SetActive(false);
        leftKick.SetActive(false);
        rightKick.SetActive(false);





    }
}
