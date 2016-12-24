# Spring Project
> This repository is for project to create web site using Spring + Maven

[![Build Status](https://travis-ci.org/SpringProject/movie-api.svg?branch=develop)](https://travis-ci.org/codechobostudy/movie-api)
[![Coverage Status](https://coveralls.io/repos/github/codechobostudy/movie-api/badge.svg?branch=develop)](https://coveralls.io/github/codechobostudy/movie-api?branch=develop)

## Development Guidelines

| Application Framework | Spring Framework |
|-----------------|----------------|
| Web Application Server | Tomcat 8.0 |
| Language | Java |
| Build Tool | Maven |

### Commit Rules
커밋에 포함될수 있는 내용이 여러 개로 나누어질수잇다  
커밋의 내용을 최소 단위로 유지해야한다  
+ 1.커밋단위  
	커밋 하나는 하나의 의도와 의미를 가져야한다.  
  한번에 여러 파일을 수정하더라도 그 의도는 단 하나여야한다 ex)버그수정, 기능추가
	* 파일을 하나만 수정하더라도 두개 이상의 의도가 있다면 하지말아야 한다
     ex) 잘못된예 = 버그 수정 + 새기능추가 
- 2.커밋메세지 작성규칙  
[category] - [simple message]  
[detailed description]  
설명  
category: 커밋의 성격이 무엇인지 한번에 알수 있는 단어로 작성한다  
message: 해당 커밋에 대한 간단한 한줄 설명  
detailed description:  

	1.  왜 커밋했는지 설명  
	2. 버그수정의 경우 원래 어떤 문제가 있었는지 설명  
	3.  사용중인 이슈 트래커가 있다면 해당 이슈의 하이퍼링크를 포함해야한다  




 __fix: 잘못된 부분 수정   
 add: 기능 추가  
 mod: 코드 수정  
 rm : 기능 삭제__  

커밋의 좋은예
<https://wiki.openstack.org/wiki/GitCommitMessages>


##브랜치 이름 작성규칙

| 이름 | 설명 |
|-----------------|----------------|
| new | 새 기능 추가가 목적인 브런치 |
| test | 무언가를 테스트하는 브런치(새 라이브러리, 배포 환경, 실험) |
| bug | 버그 수정이 목적인 브런치 |
```
#브랜치 예시 ex)
카테고리의 이름을 접두어로 사용하면서 그 뒤에 브런치 이름을 붙인다
이 때 구분자로는 슬래쉬(/) 기호를 사용하는걸 권장한다
new/feat-foo
new/feat-bar
bug/critical-thing
test/awesome-new-library

```
