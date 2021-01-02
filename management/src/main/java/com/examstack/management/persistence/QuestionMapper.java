package com.examstack.management.persistence;

import java.util.List;

import com.examstack.common.domain.question.*;
import com.examstack.common.domain.user.User;
import org.apache.ibatis.annotations.Param;
import com.examstack.management.security.UserInfo;

import com.examstack.common.util.Page;

/**
 * @author Ocelot
 * @date 2014年6月8日 下午8:32:33
 */
public interface QuestionMapper {

	public List<Question> getQuestionList(
            @Param("filter") QuestionFilter filter,
            @Param("page") Page<Question> page);

	public List<Field> getAllField(@Param("page") Page<Field> page);

	public List<KnowledgePoint> getKnowledgePointByFieldId(
            @Param("fieldId") int fieldId,
            @Param("page") Page<KnowledgePoint> page);

	public List<QuestionType> getQuestionTypeList();

	public Integer insertForeach(@Param("list") List<Question> list);

	/**
	 * 获取tag列表，包含所有公有的或者自己私有的
	 *
	 * @param userId
	 * @param page
	 * @return
	 */
	public List<Tag> getTagByUserId(@Param("userId") int userId,
                                    @Param("page") Page<Tag> page);

	/**
	 * 获取所有标签（管理员使用）
	 * @return
	 */
	public List<Tag> getTags(@Param("page") Page<Tag> page);
	/**
	 * 增加一个标签
	 *
	 * @param tag
	 */
	public void addTag(Tag tag);

	public void insertQuestion(Question question) throws Exception;

	public void addQuestionKnowledgePoint(@Param("questionId") int questionId,
                                          @Param("pointId") int pointId) throws Exception;

	public void addField(Field field);

	public void addKnowledgePoint(KnowledgePoint point);
	
	/**
	 * 获取题目的tag
	 * @param questionId
	 * @param userId
	 * @param page
	 * @return
	 */
	public List<QuestionTag> getQuestionTagByQuestionIdAndUserId(
            @Param("questionId") int questionId, @Param("userId") int userId,
            @Param("page") Page<QuestionTag> page);
	
	/**
	 * 给题目打标签
	 */
	public void addQuestionTag(@Param("array") List<QuestionTag> array);
	
	public void deleteQuestionTag(@Param("questionId") int questionId, @Param("userId") int userId, @Param("array") List<Integer> array);
	
	public void deleteQuestionPointByQuestionId(
            @Param("questionId") int questionId) throws Exception;
	
	public void deleteFieldByIdList(@Param("array") List<Integer> idList);
	
	public void deleteKnowledgePointByIdList(@Param("array") List<Integer> idList);
	
	public void deleteTagByIdList(@Param("array") List<Integer> idList);
	
	public Question getQuestionByQuestionId(@Param("questionId") int questionId);
	
	List<QuestionQueryResult> getQuestionAnalysisListByIdList(
            @Param("array") List<Integer> idList);
	
	public void deleteQuestionByQuestionId(@Param("questionId") int questionId);

	public void deleteQuestionTestByTestId(@Param("testId") int testId);

	public void deleteQuestionByTestId(@Param("testId") int testId);


	/**
	 * 获取某一题型的题目
	 * @param QuestionTypeId
	 * @param page
	 * @return
	 */
	public List<Question> getQuestionByTypeId(@Param("QuestionTypeId") int QuestionTypeId, @Param("page") Page<Question> page);
	
	/**
	 * 按知识点获取题目
	 * 
	 * @param idList
	 * @return
	 */
	List<QuestionStruts> getQuestionListByPointId(@Param("array") List<Integer> idList);
	
	/**
	 * 根据fieldId,pointId,typeId分组统计题目数量
	 * @param fieldId
	 * @return
	 */
	public List<QuestionStatistic> getTypeQuestionStaticByFieldId(int fieldId);
	
	/**
	 * 更新一道题目
	 * @param question Object为null，int＝0则不更新
	 */
	public void updateQuestion(Question question);



	/**
	 * 更新一張試卷
	 * @param question Object为null，int＝0则不更新
	 */
	public void updateQuestionAnswer(Question question);
	
	/**
	 * 获取题目的知识点
	 * @param questionId
	 */
	public List<KnowledgePoint> getQuestionPoint(int questionId);
	
	/**
	 * 获取题目标签
	 * @param questionId
	 * @return
	 */
	public List<Tag> getQuestionTags(int questionId);
	
	/**
	 * 获取知识点统计信息
	 * @param fieldId
	 * @return
	 */
	public List<PointStatistic> getPointCount(@Param("fieldId") int fieldId, @Param("page") Page<PointStatistic> page);

	/**
	 * 获取导入题目标题最大ID
	 * @param
	 * @return
	 */
	public int getQuestionTestMaxId();

	/**
	 * 获取导入题目标题列表
	 * @param
	 * @return
	 */
	public List<QuestionTest> getQuestionTestList(int start, int end);


	public List<QuestionTest> getQuestionTestPageList(
			@Param("filter") QuestionFilter filter,
			@Param("page") Page<Question> page);
	/**
	 * 给导入题目添加题目
	 */
	public void addQuestionTest(QuestionTest questionTest);

	/**
	 * 更新一道题目試卷
	 * @param questionTest Object为null，int＝0则不更新
	 */
	public void updateQuestionTest(QuestionTest questionTest);

	/**
	 * 获取某一题目标题记录
	 * @param id
	 * @return
	 */
	public QuestionTest getQuestionTestById(@Param("id") int id);


}
