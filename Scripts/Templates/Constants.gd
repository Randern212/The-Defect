extends Node

enum playerStates
{
	IDLE,
	RUN,
	ATTACK,
	JUMP,
	FALL,
	DASH,
	DEFLECT,
	STAGGER
}

enum enemyStates
{
	IDLE,
	CHASE,
	ATTACK
}
enum Scenes
{
	NAVIGATIONDEMO,
	MAINMENU,
	CONTROLS,
	CREDITS,
	LEVEL1,
}
const sceneDictionary:Dictionary={
	Scenes.NAVIGATIONDEMO:"uid://bfvs44s8glia6",
	Scenes.MAINMENU:"uid://1lvm27q5jg0n",
	Scenes.CONTROLS:"uid://bqeu1cg57046u",
	Scenes.CREDITS:"uid://5xhpg6qdjiu5",
	Scenes.LEVEL1:"uid://bnsrguh200nd6",
}
