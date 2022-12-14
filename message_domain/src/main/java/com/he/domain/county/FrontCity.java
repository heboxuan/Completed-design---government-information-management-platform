package com.he.domain.county;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FrontCity implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column front_city.id
     *
     * @mbg.generated
     */
    private Long id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column front_city.name
     *
     * @mbg.generated
     */
    private String name;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column front_city.ask_num
     *
     * @mbg.generated
     */
    private Long askNum;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column front_city.response_num
     *
     * @mbg.generated
     */
    private Long responseNum;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column front_city.is_delete
     *
     * @mbg.generated
     */
    private String isDelete;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column front_city.id
     *
     * @return the value of front_city.id
     *
     * @mbg.generated
     */
    public Long getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column front_city.id
     *
     * @param id the value for front_city.id
     *
     * @mbg.generated
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column front_city.name
     *
     * @return the value of front_city.name
     *
     * @mbg.generated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column front_city.name
     *
     * @param name the value for front_city.name
     *
     * @mbg.generated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column front_city.ask_num
     *
     * @return the value of front_city.ask_num
     *
     * @mbg.generated
     */
    public Long getAskNum() {
        return askNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column front_city.ask_num
     *
     * @param askNum the value for front_city.ask_num
     *
     * @mbg.generated
     */
    public void setAskNum(Long askNum) {
        this.askNum = askNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column front_city.response_num
     *
     * @return the value of front_city.response_num
     *
     * @mbg.generated
     */
    public Long getResponseNum() {
        return responseNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column front_city.response_num
     *
     * @param responseNum the value for front_city.response_num
     *
     * @mbg.generated
     */
    public void setResponseNum(Long responseNum) {
        this.responseNum = responseNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column front_city.is_delete
     *
     * @return the value of front_city.is_delete
     *
     * @mbg.generated
     */
    public String getIsDelete() {
        return isDelete;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column front_city.is_delete
     *
     * @param isDelete the value for front_city.is_delete
     *
     * @mbg.generated
     */
    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete == null ? null : isDelete.trim();
    }
}