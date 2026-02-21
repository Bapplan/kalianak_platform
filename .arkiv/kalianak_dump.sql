--
-- PostgreSQL database dump
--

\restrict QHcf8f4gVGJE3sUBqlYjqYrpTAk16UgyJCoriHAzdlZ8X1jVE5dvOiMIGho3q5v

-- Dumped from database version 15.15
-- Dumped by pg_dump version 15.15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.users_staffshift DROP CONSTRAINT users_staffshift_staff_id_c07810d3_fk_users_staffmember_id;
ALTER TABLE ONLY public.users_staffshift DROP CONSTRAINT users_staffshift_restaurant_id_6c133996_fk_users_restaurant_id;
ALTER TABLE ONLY public.users_staffpayroll DROP CONSTRAINT users_staffpayroll_staff_id_8c81bceb_fk_users_staffmember_id;
ALTER TABLE ONLY public.users_staffpayroll DROP CONSTRAINT users_staffpayroll_restaurant_id_76db0638_fk_users_res;
ALTER TABLE ONLY public.users_staffmember DROP CONSTRAINT users_staffmember_user_id_3f3e1d1c_fk_auth_user_id;
ALTER TABLE ONLY public.users_staffmember DROP CONSTRAINT users_staffmember_restaurant_id_0049184f_fk_users_restaurant_id;
ALTER TABLE ONLY public.users_staffleave DROP CONSTRAINT users_staffleave_staff_id_fe563a7a_fk_users_staffmember_id;
ALTER TABLE ONLY public.users_staffleave DROP CONSTRAINT users_staffleave_restaurant_id_803e71db_fk_users_restaurant_id;
ALTER TABLE ONLY public.users_staffleave DROP CONSTRAINT users_staffleave_approved_by_id_47f4c2e0_fk_users_sta;
ALTER TABLE ONLY public.users_staffemployment DROP CONSTRAINT users_staffemployment_staff_id_51e77011_fk_users_staffmember_id;
ALTER TABLE ONLY public.users_staffemployment DROP CONSTRAINT users_staffemploymen_restaurant_id_d0127cf7_fk_users_res;
ALTER TABLE ONLY public.users_staffattendance DROP CONSTRAINT users_staffattendance_staff_id_4c250477_fk_users_staffmember_id;
ALTER TABLE ONLY public.users_staffattendance DROP CONSTRAINT users_staffattendanc_restaurant_id_a4c2f5e2_fk_users_res;
ALTER TABLE ONLY public.users_customer DROP CONSTRAINT users_customer_user_id_a09bb4be_fk_auth_user_id;
ALTER TABLE ONLY public.pos_registersession DROP CONSTRAINT pos_registersession_staff_member_id_b1c41646_fk_users_sta;
ALTER TABLE ONLY public.pos_registersession DROP CONSTRAINT pos_registersession_register_id_bcc9d251_fk_pos_cashregister_id;
ALTER TABLE ONLY public.pos_registeralert DROP CONSTRAINT pos_registeralert_session_id_d7df18f4_fk_pos_registersession_id;
ALTER TABLE ONLY public.pos_registeralert DROP CONSTRAINT pos_registeralert_register_id_a3dfce54_fk_pos_cashregister_id;
ALTER TABLE ONLY public.pos_registeralert DROP CONSTRAINT pos_registeralert_acknowledged_by_id_34aebb2e_fk_auth_user_id;
ALTER TABLE ONLY public.pos_cashtransaction DROP CONSTRAINT pos_cashtransaction_session_id_820aecee_fk_pos_regis;
ALTER TABLE ONLY public.pos_cashtransaction DROP CONSTRAINT pos_cashtransaction_reference_order_id_3ec516e4_fk_orders_or;
ALTER TABLE ONLY public.pos_cashtransaction DROP CONSTRAINT pos_cashtransaction_created_by_id_cd1aa229_fk_auth_user_id;
ALTER TABLE ONLY public.pos_cashregister DROP CONSTRAINT pos_cashregister_restaurant_id_3408636c_fk_users_restaurant_id;
ALTER TABLE ONLY public.orders_table DROP CONSTRAINT orders_table_restaurant_id_86b046c6_fk_users_restaurant_id;
ALTER TABLE ONLY public.orders_paymenttransaction DROP CONSTRAINT orders_paymenttransa_payment_id_2ae7371f_fk_orders_pa;
ALTER TABLE ONLY public.orders_payment DROP CONSTRAINT orders_payment_order_id_bdccf250_fk_orders_order_id;
ALTER TABLE ONLY public.orders_orderdish DROP CONSTRAINT orders_orderdish_order_id_979b1d80_fk_orders_order_id;
ALTER TABLE ONLY public.orders_orderdish DROP CONSTRAINT orders_orderdish_dish_id_d25f0b23_fk_menu_dish_id;
ALTER TABLE ONLY public.orders_order DROP CONSTRAINT orders_order_table_id_14015bc1_fk_orders_table_id;
ALTER TABLE ONLY public.orders_order DROP CONSTRAINT orders_order_restaurant_id_a38fbfc0_fk_users_restaurant_id;
ALTER TABLE ONLY public.orders_order DROP CONSTRAINT orders_order_created_by_id_d5f5e69c_fk_auth_user_id;
ALTER TABLE ONLY public.menu_dishingredient DROP CONSTRAINT menu_dishingredient_ingredient_id_47a5f632_fk_inventory;
ALTER TABLE ONLY public.menu_dishingredient DROP CONSTRAINT menu_dishingredient_dish_id_47ac620a_fk_menu_dish_id;
ALTER TABLE ONLY public.menu_dish DROP CONSTRAINT menu_dish_category_id_16b2903d_fk_menu_category_id;
ALTER TABLE ONLY public.inventory_stockitem DROP CONSTRAINT inventory_stockitem_restaurant_id_a744d075_fk_users_res;
ALTER TABLE ONLY public.inventory_restockorder DROP CONSTRAINT inventory_restockord_restaurant_id_afea1047_fk_users_res;
ALTER TABLE ONLY public.inventory_restockitem DROP CONSTRAINT inventory_restockite_restock_order_id_76e87831_fk_inventory;
ALTER TABLE ONLY public.inventory_inventorystock DROP CONSTRAINT inventory_inventorys_supplies_id_4651796d_fk_inventory;
ALTER TABLE ONLY public.inventory_inventorystock DROP CONSTRAINT inventory_inventorys_restaurant_id_530ccc71_fk_users_res;
ALTER TABLE ONLY public.inventory_inventorystock DROP CONSTRAINT inventory_inventorys_ingredient_id_6267079a_fk_inventory;
ALTER TABLE ONLY public.inventory_inventorystock DROP CONSTRAINT inventory_inventorys_hygiene_id_c10ae46b_fk_inventory;
ALTER TABLE ONLY public.inventory_inventorylocation DROP CONSTRAINT inventory_inventoryl_restaurant_id_465a284a_fk_users_res;
ALTER TABLE ONLY public.expenses_expensecategory DROP CONSTRAINT expenses_expensecategory_account_id_efff0591_fk_bank_account_id;
ALTER TABLE ONLY public.expenses_expensecategory DROP CONSTRAINT expenses_expensecate_restaurant_id_5eb6a2bd_fk_users_res;
ALTER TABLE ONLY public.expenses_expense DROP CONSTRAINT expenses_expense_transaction_id_e148c4fc_fk_bank_transaction_id;
ALTER TABLE ONLY public.expenses_expense DROP CONSTRAINT expenses_expense_restaurant_id_58246625_fk_users_restaurant_id;
ALTER TABLE ONLY public.expenses_expense DROP CONSTRAINT expenses_expense_payment_account_id_9abbe10b_fk_bank_account_id;
ALTER TABLE ONLY public.expenses_expense DROP CONSTRAINT expenses_expense_category_id_aa33bbdd_fk_expenses_;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE ONLY public.bank_transaction DROP CONSTRAINT bank_transaction_restaurant_id_79b979f0_fk_users_restaurant_id;
ALTER TABLE ONLY public.bank_transaction DROP CONSTRAINT bank_transaction_related_order_id_95fa0b56_fk_orders_order_id;
ALTER TABLE ONLY public.bank_journalentry DROP CONSTRAINT bank_journalentry_transaction_id_fa57c6f5_fk_bank_tran;
ALTER TABLE ONLY public.bank_journalentry DROP CONSTRAINT bank_journalentry_account_id_9efacffb_fk_bank_account_id;
ALTER TABLE ONLY public.bank_account DROP CONSTRAINT bank_account_restaurant_id_98f45ae4_fk_users_restaurant_id;
ALTER TABLE ONLY public.bank_account DROP CONSTRAINT bank_account_group_id_70af62e9_fk_bank_accountgroup_id;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
DROP INDEX public.users_staffshift_staff_id_c07810d3;
DROP INDEX public.users_staffshift_restaurant_id_6c133996;
DROP INDEX public.users_staffpayroll_staff_id_8c81bceb;
DROP INDEX public.users_staffpayroll_restaurant_id_76db0638;
DROP INDEX public.users_staffmember_restaurant_id_0049184f;
DROP INDEX public.users_staffleave_staff_id_fe563a7a;
DROP INDEX public.users_staffleave_restaurant_id_803e71db;
DROP INDEX public.users_staffleave_approved_by_id_47f4c2e0;
DROP INDEX public.users_staffemployment_staff_id_51e77011;
DROP INDEX public.users_staffemployment_restaurant_id_d0127cf7;
DROP INDEX public.users_staffattendance_staff_id_4c250477;
DROP INDEX public.users_staffattendance_restaurant_id_a4c2f5e2;
DROP INDEX public.users_staff_status_ca3a53_idx;
DROP INDEX public.users_staff_staff_i_9eb4cb_idx;
DROP INDEX public.users_staff_staff_i_79c51c_idx;
DROP INDEX public.users_staff_staff_i_65f325_idx;
DROP INDEX public.users_staff_staff_i_1525a4_idx;
DROP INDEX public.users_staff_restaur_fbd834_idx;
DROP INDEX public.users_staff_restaur_93ba40_idx;
DROP INDEX public.users_staff_restaur_5e83cc_idx;
DROP INDEX public.users_staff_restaur_595dae_idx;
DROP INDEX public.users_staff_restaur_4f62e0_idx;
DROP INDEX public.users_restaurant_code_05b5e6e0_like;
DROP INDEX public.users_customer_phone_3d9288bb_like;
DROP INDEX public.pos_registersession_staff_member_id_b1c41646;
DROP INDEX public.pos_registersession_register_id_bcc9d251;
DROP INDEX public.pos_registeralert_session_id_d7df18f4;
DROP INDEX public.pos_registeralert_register_id_a3dfce54;
DROP INDEX public.pos_registeralert_acknowledged_by_id_34aebb2e;
DROP INDEX public.pos_cashtransaction_session_id_820aecee;
DROP INDEX public.pos_cashtransaction_reference_order_id_3ec516e4;
DROP INDEX public.pos_cashtransaction_created_by_id_cd1aa229;
DROP INDEX public.pos_cashregister_restaurant_id_3408636c;
DROP INDEX public.orders_table_restaurant_id_86b046c6;
DROP INDEX public.orders_paymenttransaction_payment_id_2ae7371f;
DROP INDEX public.orders_payment_order_id_bdccf250;
DROP INDEX public.orders_orderdish_order_id_979b1d80;
DROP INDEX public.orders_orderdish_dish_id_d25f0b23;
DROP INDEX public.orders_order_table_id_14015bc1;
DROP INDEX public.orders_order_restaurant_id_a38fbfc0;
DROP INDEX public.orders_order_order_number_4e985f70_like;
DROP INDEX public.orders_order_created_by_id_d5f5e69c;
DROP INDEX public.menu_dishingredient_ingredient_id_47a5f632;
DROP INDEX public.menu_dishingredient_dish_id_47ac620a;
DROP INDEX public.menu_dish_category_id_16b2903d;
DROP INDEX public.inventory_stockitem_restaurant_id_a744d075;
DROP INDEX public.inventory_restockorder_restaurant_id_afea1047;
DROP INDEX public.inventory_restockitem_restock_order_id_76e87831;
DROP INDEX public.inventory_inventorystock_supplies_id_4651796d;
DROP INDEX public.inventory_inventorystock_restaurant_id_530ccc71;
DROP INDEX public.inventory_inventorystock_ingredient_id_6267079a;
DROP INDEX public.inventory_inventorystock_hygiene_id_c10ae46b;
DROP INDEX public.inventory_inventorylocation_restaurant_id_465a284a;
DROP INDEX public.expenses_expensecategory_restaurant_id_5eb6a2bd;
DROP INDEX public.expenses_expensecategory_account_id_efff0591;
DROP INDEX public.expenses_expense_restaurant_id_58246625;
DROP INDEX public.expenses_expense_payment_account_id_9abbe10b;
DROP INDEX public.expenses_expense_category_id_aa33bbdd;
DROP INDEX public.django_session_session_key_c0390e0f_like;
DROP INDEX public.django_session_expire_date_a5c62663;
DROP INDEX public.django_admin_log_user_id_c564eba6;
DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX public.bank_transaction_restaurant_id_79b979f0;
DROP INDEX public.bank_transaction_related_order_id_95fa0b56;
DROP INDEX public.bank_journalentry_transaction_id_fa57c6f5;
DROP INDEX public.bank_journalentry_account_id_9efacffb;
DROP INDEX public.bank_account_restaurant_id_98f45ae4;
DROP INDEX public.bank_account_group_id_70af62e9;
DROP INDEX public.auth_user_username_6821ab7c_like;
DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
DROP INDEX public.auth_user_groups_group_id_97559544;
DROP INDEX public.auth_permission_content_type_id_2f476e4b;
DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX public.auth_group_name_a6ea08ec_like;
ALTER TABLE ONLY public.users_staffshift DROP CONSTRAINT users_staffshift_pkey;
ALTER TABLE ONLY public.users_staffpayroll DROP CONSTRAINT users_staffpayroll_staff_id_period_start_pe_abdd7762_uniq;
ALTER TABLE ONLY public.users_staffpayroll DROP CONSTRAINT users_staffpayroll_pkey;
ALTER TABLE ONLY public.users_staffmember DROP CONSTRAINT users_staffmember_user_id_key;
ALTER TABLE ONLY public.users_staffmember DROP CONSTRAINT users_staffmember_pkey;
ALTER TABLE ONLY public.users_staffleave DROP CONSTRAINT users_staffleave_pkey;
ALTER TABLE ONLY public.users_staffemployment DROP CONSTRAINT users_staffemployment_pkey;
ALTER TABLE ONLY public.users_staffattendance DROP CONSTRAINT users_staffattendance_staff_id_date_c123e3d5_uniq;
ALTER TABLE ONLY public.users_staffattendance DROP CONSTRAINT users_staffattendance_pkey;
ALTER TABLE ONLY public.users_restaurant DROP CONSTRAINT users_restaurant_pkey;
ALTER TABLE ONLY public.users_restaurant DROP CONSTRAINT users_restaurant_code_key;
ALTER TABLE ONLY public.users_customer DROP CONSTRAINT users_customer_user_id_key;
ALTER TABLE ONLY public.users_customer DROP CONSTRAINT users_customer_pkey;
ALTER TABLE ONLY public.users_customer DROP CONSTRAINT users_customer_phone_key;
ALTER TABLE ONLY public.pos_registersession DROP CONSTRAINT pos_registersession_pkey;
ALTER TABLE ONLY public.pos_registeralert DROP CONSTRAINT pos_registeralert_pkey;
ALTER TABLE ONLY public.pos_cashtransaction DROP CONSTRAINT pos_cashtransaction_pkey;
ALTER TABLE ONLY public.pos_cashregister DROP CONSTRAINT pos_cashregister_pkey;
ALTER TABLE ONLY public.pos_cashregister DROP CONSTRAINT pos_cashregister_name_restaurant_id_45173a39_uniq;
ALTER TABLE ONLY public.orders_table DROP CONSTRAINT orders_table_pkey;
ALTER TABLE ONLY public.orders_paymenttransaction DROP CONSTRAINT orders_paymenttransaction_pkey;
ALTER TABLE ONLY public.orders_payment DROP CONSTRAINT orders_payment_pkey;
ALTER TABLE ONLY public.orders_orderdish DROP CONSTRAINT orders_orderdish_pkey;
ALTER TABLE ONLY public.orders_order DROP CONSTRAINT orders_order_pkey;
ALTER TABLE ONLY public.orders_order DROP CONSTRAINT orders_order_order_number_key;
ALTER TABLE ONLY public.menu_dishingredient DROP CONSTRAINT menu_dishingredient_pkey;
ALTER TABLE ONLY public.menu_dish DROP CONSTRAINT menu_dish_pkey;
ALTER TABLE ONLY public.menu_category DROP CONSTRAINT menu_category_pkey;
ALTER TABLE ONLY public.inventory_supplies DROP CONSTRAINT inventory_supplies_pkey;
ALTER TABLE ONLY public.inventory_stockitem DROP CONSTRAINT inventory_stockitem_pkey;
ALTER TABLE ONLY public.inventory_restockorder DROP CONSTRAINT inventory_restockorder_pkey;
ALTER TABLE ONLY public.inventory_restockitem DROP CONSTRAINT inventory_restockitem_pkey;
ALTER TABLE ONLY public.inventory_inventorystock DROP CONSTRAINT inventory_inventorystock_restaurant_id_supplies_i_c1d33a71_uniq;
ALTER TABLE ONLY public.inventory_inventorystock DROP CONSTRAINT inventory_inventorystock_restaurant_id_ingredient_ecdb322a_uniq;
ALTER TABLE ONLY public.inventory_inventorystock DROP CONSTRAINT inventory_inventorystock_restaurant_id_hygiene_id_55b108c4_uniq;
ALTER TABLE ONLY public.inventory_inventorystock DROP CONSTRAINT inventory_inventorystock_pkey;
ALTER TABLE ONLY public.inventory_inventorylocation DROP CONSTRAINT inventory_inventorylocation_pkey;
ALTER TABLE ONLY public.inventory_ingredient DROP CONSTRAINT inventory_ingredient_pkey;
ALTER TABLE ONLY public.inventory_hygiene DROP CONSTRAINT inventory_hygiene_pkey;
ALTER TABLE ONLY public.expenses_expensecategory DROP CONSTRAINT expenses_expensecategory_restaurant_id_name_9ae88fbc_uniq;
ALTER TABLE ONLY public.expenses_expensecategory DROP CONSTRAINT expenses_expensecategory_pkey;
ALTER TABLE ONLY public.expenses_expense DROP CONSTRAINT expenses_expense_transaction_id_key;
ALTER TABLE ONLY public.expenses_expense DROP CONSTRAINT expenses_expense_pkey;
ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
ALTER TABLE ONLY public.bank_transaction DROP CONSTRAINT bank_transaction_pkey;
ALTER TABLE ONLY public.bank_journalentry DROP CONSTRAINT bank_journalentry_pkey;
ALTER TABLE ONLY public.bank_accountgroup DROP CONSTRAINT bank_accountgroup_pkey;
ALTER TABLE ONLY public.bank_account DROP CONSTRAINT bank_account_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
DROP TABLE public.users_staffshift;
DROP TABLE public.users_staffpayroll;
DROP TABLE public.users_staffmember;
DROP TABLE public.users_staffleave;
DROP TABLE public.users_staffemployment;
DROP TABLE public.users_staffattendance;
DROP TABLE public.users_restaurant;
DROP TABLE public.users_customer;
DROP TABLE public.pos_registersession;
DROP TABLE public.pos_registeralert;
DROP TABLE public.pos_cashtransaction;
DROP TABLE public.pos_cashregister;
DROP TABLE public.orders_table;
DROP TABLE public.orders_paymenttransaction;
DROP TABLE public.orders_payment;
DROP TABLE public.orders_orderdish;
DROP TABLE public.orders_order;
DROP TABLE public.menu_dishingredient;
DROP TABLE public.menu_dish;
DROP TABLE public.menu_category;
DROP TABLE public.inventory_supplies;
DROP TABLE public.inventory_stockitem;
DROP TABLE public.inventory_restockorder;
DROP TABLE public.inventory_restockitem;
DROP TABLE public.inventory_inventorystock;
DROP TABLE public.inventory_inventorylocation;
DROP TABLE public.inventory_ingredient;
DROP TABLE public.inventory_hygiene;
DROP TABLE public.expenses_expensecategory;
DROP TABLE public.expenses_expense;
DROP TABLE public.django_session;
DROP TABLE public.django_migrations;
DROP TABLE public.django_content_type;
DROP TABLE public.django_admin_log;
DROP TABLE public.bank_transaction;
DROP TABLE public.bank_journalentry;
DROP TABLE public.bank_accountgroup;
DROP TABLE public.bank_account;
DROP TABLE public.auth_user_user_permissions;
DROP TABLE public.auth_user_groups;
DROP TABLE public.auth_user;
DROP TABLE public.auth_permission;
DROP TABLE public.auth_group_permissions;
DROP TABLE public.auth_group;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ikan_bakar_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ikan_bakar_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ikan_bakar_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO ikan_bakar_user;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO ikan_bakar_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO ikan_bakar_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bank_account; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.bank_account (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    restaurant_id bigint,
    code character varying(20) NOT NULL,
    group_id bigint
);


ALTER TABLE public.bank_account OWNER TO ikan_bakar_user;

--
-- Name: bank_account_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.bank_account ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bank_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bank_accountgroup; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.bank_accountgroup (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(20) NOT NULL
);


ALTER TABLE public.bank_accountgroup OWNER TO ikan_bakar_user;

--
-- Name: bank_accountgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.bank_accountgroup ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bank_accountgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bank_journalentry; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.bank_journalentry (
    id bigint NOT NULL,
    debit numeric(12,2) NOT NULL,
    credit numeric(12,2) NOT NULL,
    account_id bigint NOT NULL,
    transaction_id bigint NOT NULL
);


ALTER TABLE public.bank_journalentry OWNER TO ikan_bakar_user;

--
-- Name: bank_journalentry_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.bank_journalentry ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bank_journalentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bank_transaction; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.bank_transaction (
    id bigint NOT NULL,
    date timestamp with time zone NOT NULL,
    description character varying(255) NOT NULL,
    related_order_id bigint,
    restaurant_id bigint
);


ALTER TABLE public.bank_transaction OWNER TO ikan_bakar_user;

--
-- Name: bank_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.bank_transaction ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bank_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO ikan_bakar_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ikan_bakar_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ikan_bakar_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ikan_bakar_user;

--
-- Name: expenses_expense; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.expenses_expense (
    id bigint NOT NULL,
    amount numeric(12,2) NOT NULL,
    date date NOT NULL,
    description text NOT NULL,
    is_payroll boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    payment_account_id bigint NOT NULL,
    restaurant_id bigint NOT NULL,
    transaction_id bigint,
    category_id bigint NOT NULL
);


ALTER TABLE public.expenses_expense OWNER TO ikan_bakar_user;

--
-- Name: expenses_expense_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.expenses_expense ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.expenses_expense_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: expenses_expensecategory; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.expenses_expensecategory (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    account_id bigint NOT NULL,
    restaurant_id bigint NOT NULL
);


ALTER TABLE public.expenses_expensecategory OWNER TO ikan_bakar_user;

--
-- Name: expenses_expensecategory_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.expenses_expensecategory ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.expenses_expensecategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: inventory_hygiene; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.inventory_hygiene (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    unit character varying(20) NOT NULL,
    image character varying(100),
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.inventory_hygiene OWNER TO ikan_bakar_user;

--
-- Name: inventory_hygiene_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.inventory_hygiene ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.inventory_hygiene_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: inventory_ingredient; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.inventory_ingredient (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    unit character varying(20) NOT NULL,
    image character varying(100),
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.inventory_ingredient OWNER TO ikan_bakar_user;

--
-- Name: inventory_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.inventory_ingredient ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.inventory_ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: inventory_inventorylocation; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.inventory_inventorylocation (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    is_default boolean NOT NULL,
    restaurant_id bigint NOT NULL
);


ALTER TABLE public.inventory_inventorylocation OWNER TO ikan_bakar_user;

--
-- Name: inventory_inventorylocation_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.inventory_inventorylocation ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.inventory_inventorylocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: inventory_inventorystock; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.inventory_inventorystock (
    id bigint NOT NULL,
    stock numeric(12,2) NOT NULL,
    max_stock numeric(12,2) NOT NULL,
    low_stock_threshold numeric(12,2) NOT NULL,
    hygiene_id bigint,
    ingredient_id bigint,
    restaurant_id bigint NOT NULL,
    supplies_id bigint
);


ALTER TABLE public.inventory_inventorystock OWNER TO ikan_bakar_user;

--
-- Name: inventory_inventorystock_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.inventory_inventorystock ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.inventory_inventorystock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: inventory_restockitem; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.inventory_restockitem (
    id bigint NOT NULL,
    item_type character varying(20) NOT NULL,
    item_id integer NOT NULL,
    quantity_needed numeric(10,2) NOT NULL,
    quantity_purchased numeric(10,2) NOT NULL,
    restock_order_id bigint NOT NULL,
    CONSTRAINT inventory_restockitem_item_id_check CHECK ((item_id >= 0))
);


ALTER TABLE public.inventory_restockitem OWNER TO ikan_bakar_user;

--
-- Name: inventory_restockitem_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.inventory_restockitem ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.inventory_restockitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: inventory_restockorder; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.inventory_restockorder (
    id bigint NOT NULL,
    status character varying(20) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    restaurant_id bigint
);


ALTER TABLE public.inventory_restockorder OWNER TO ikan_bakar_user;

--
-- Name: inventory_restockorder_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.inventory_restockorder ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.inventory_restockorder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: inventory_stockitem; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.inventory_stockitem (
    id bigint NOT NULL,
    unit character varying(20) NOT NULL,
    restaurant_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    stock numeric(12,2) NOT NULL,
    max_stock numeric(12,2) NOT NULL,
    price numeric(12,2) NOT NULL,
    image character varying(100)
);


ALTER TABLE public.inventory_stockitem OWNER TO ikan_bakar_user;

--
-- Name: inventory_stockitem_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.inventory_stockitem ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.inventory_stockitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: inventory_supplies; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.inventory_supplies (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    unit character varying(20) NOT NULL,
    image character varying(100),
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.inventory_supplies OWNER TO ikan_bakar_user;

--
-- Name: inventory_supplies_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.inventory_supplies ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.inventory_supplies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: menu_category; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.menu_category (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.menu_category OWNER TO ikan_bakar_user;

--
-- Name: menu_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.menu_category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.menu_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: menu_dish; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.menu_dish (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL,
    description text NOT NULL,
    is_available boolean NOT NULL,
    image character varying(100),
    category_id bigint NOT NULL
);


ALTER TABLE public.menu_dish OWNER TO ikan_bakar_user;

--
-- Name: menu_dish_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.menu_dish ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.menu_dish_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: menu_dishingredient; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.menu_dishingredient (
    id bigint NOT NULL,
    amount numeric(10,2) NOT NULL,
    dish_id bigint NOT NULL,
    ingredient_id bigint NOT NULL,
    unit character varying(20) NOT NULL
);


ALTER TABLE public.menu_dishingredient OWNER TO ikan_bakar_user;

--
-- Name: menu_dishingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.menu_dishingredient ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.menu_dishingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: orders_order; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.orders_order (
    id bigint NOT NULL,
    order_number character varying(50) NOT NULL,
    status character varying(20) NOT NULL,
    total_price numeric(12,2) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    table_id bigint,
    payment_method character varying(20),
    created_by_id integer,
    printed boolean NOT NULL,
    restaurant_id bigint
);


ALTER TABLE public.orders_order OWNER TO ikan_bakar_user;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.orders_order ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: orders_orderdish; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.orders_orderdish (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    price_per_unit numeric(10,2) NOT NULL,
    dish_id bigint NOT NULL,
    order_id bigint NOT NULL,
    CONSTRAINT orders_orderdish_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.orders_orderdish OWNER TO ikan_bakar_user;

--
-- Name: orders_orderdish_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.orders_orderdish ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_orderdish_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: orders_payment; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.orders_payment (
    id bigint NOT NULL,
    method character varying(20) NOT NULL,
    amount numeric(12,2) NOT NULL,
    received_cash numeric(12,2),
    change numeric(12,2) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE public.orders_payment OWNER TO ikan_bakar_user;

--
-- Name: orders_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.orders_payment ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: orders_paymenttransaction; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.orders_paymenttransaction (
    id bigint NOT NULL,
    provider character varying(50) NOT NULL,
    reference character varying(100) NOT NULL,
    status character varying(30) NOT NULL,
    raw_response text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    payment_id bigint NOT NULL
);


ALTER TABLE public.orders_paymenttransaction OWNER TO ikan_bakar_user;

--
-- Name: orders_paymenttransaction_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.orders_paymenttransaction ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_paymenttransaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: orders_table; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.orders_table (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    restaurant_id bigint
);


ALTER TABLE public.orders_table OWNER TO ikan_bakar_user;

--
-- Name: orders_table_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.orders_table ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pos_cashregister; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.pos_cashregister (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    location character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    restaurant_id bigint NOT NULL
);


ALTER TABLE public.pos_cashregister OWNER TO ikan_bakar_user;

--
-- Name: pos_cashregister_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.pos_cashregister ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.pos_cashregister_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pos_cashtransaction; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.pos_cashtransaction (
    id bigint NOT NULL,
    transaction_type character varying(20) NOT NULL,
    amount numeric(12,2) NOT NULL,
    description character varying(200) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    reference_order_id bigint,
    session_id bigint NOT NULL
);


ALTER TABLE public.pos_cashtransaction OWNER TO ikan_bakar_user;

--
-- Name: pos_cashtransaction_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.pos_cashtransaction ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.pos_cashtransaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pos_registeralert; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.pos_registeralert (
    id bigint NOT NULL,
    alert_type character varying(20) NOT NULL,
    severity character varying(10) NOT NULL,
    message text NOT NULL,
    is_acknowledged boolean NOT NULL,
    acknowledged_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    acknowledged_by_id integer,
    register_id bigint NOT NULL,
    session_id bigint
);


ALTER TABLE public.pos_registeralert OWNER TO ikan_bakar_user;

--
-- Name: pos_registeralert_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.pos_registeralert ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.pos_registeralert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pos_registersession; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.pos_registersession (
    id bigint NOT NULL,
    started_at timestamp with time zone NOT NULL,
    ended_at timestamp with time zone,
    opening_cash_amount numeric(12,2) NOT NULL,
    closing_cash_amount numeric(12,2),
    expected_cash_amount numeric(12,2) NOT NULL,
    cash_variance numeric(12,2) NOT NULL,
    opening_notes text NOT NULL,
    closing_notes text NOT NULL,
    register_id bigint NOT NULL,
    staff_member_id bigint NOT NULL
);


ALTER TABLE public.pos_registersession OWNER TO ikan_bakar_user;

--
-- Name: pos_registersession_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.pos_registersession ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.pos_registersession_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_customer; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.users_customer (
    id bigint NOT NULL,
    phone character varying(30) NOT NULL,
    points_balance integer NOT NULL,
    tier character varying(20) NOT NULL,
    avatar character varying(100),
    created_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_customer OWNER TO ikan_bakar_user;

--
-- Name: users_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.users_customer ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_restaurant; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.users_restaurant (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(20) NOT NULL,
    address text NOT NULL,
    active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.users_restaurant OWNER TO ikan_bakar_user;

--
-- Name: users_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.users_restaurant ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_staffattendance; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.users_staffattendance (
    id bigint NOT NULL,
    date date NOT NULL,
    status character varying(20) NOT NULL,
    reason character varying(255) NOT NULL,
    notes text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    restaurant_id bigint NOT NULL,
    staff_id bigint NOT NULL
);


ALTER TABLE public.users_staffattendance OWNER TO ikan_bakar_user;

--
-- Name: users_staffattendance_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.users_staffattendance ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_staffattendance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_staffemployment; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.users_staffemployment (
    id bigint NOT NULL,
    employment_type character varying(20) NOT NULL,
    salary_amount numeric(12,2),
    hourly_rate numeric(12,2),
    currency character varying(10) NOT NULL,
    start_date date NOT NULL,
    end_date date,
    is_current boolean NOT NULL,
    notes text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    restaurant_id bigint NOT NULL,
    staff_id bigint NOT NULL
);


ALTER TABLE public.users_staffemployment OWNER TO ikan_bakar_user;

--
-- Name: users_staffemployment_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.users_staffemployment ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_staffemployment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_staffleave; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.users_staffleave (
    id bigint NOT NULL,
    leave_type character varying(20) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    status character varying(20) NOT NULL,
    reason character varying(255) NOT NULL,
    notes text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    approved_by_id bigint,
    restaurant_id bigint NOT NULL,
    staff_id bigint NOT NULL
);


ALTER TABLE public.users_staffleave OWNER TO ikan_bakar_user;

--
-- Name: users_staffleave_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.users_staffleave ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_staffleave_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_staffmember; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.users_staffmember (
    id bigint NOT NULL,
    role character varying(20) NOT NULL,
    image character varying(100),
    active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    restaurant_id bigint NOT NULL,
    user_id integer NOT NULL,
    date_of_birth date,
    phone character varying(30) NOT NULL
);


ALTER TABLE public.users_staffmember OWNER TO ikan_bakar_user;

--
-- Name: users_staffmember_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.users_staffmember ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_staffmember_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_staffpayroll; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.users_staffpayroll (
    id bigint NOT NULL,
    period_start date NOT NULL,
    period_end date NOT NULL,
    total_hours numeric(10,2) NOT NULL,
    gross_amount numeric(12,2) NOT NULL,
    net_amount numeric(12,2) NOT NULL,
    status character varying(20) NOT NULL,
    processed_at timestamp with time zone,
    notes text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    restaurant_id bigint NOT NULL,
    staff_id bigint NOT NULL
);


ALTER TABLE public.users_staffpayroll OWNER TO ikan_bakar_user;

--
-- Name: users_staffpayroll_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.users_staffpayroll ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_staffpayroll_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_staffshift; Type: TABLE; Schema: public; Owner: ikan_bakar_user
--

CREATE TABLE public.users_staffshift (
    id bigint NOT NULL,
    scheduled_start timestamp with time zone NOT NULL,
    scheduled_end timestamp with time zone NOT NULL,
    actual_start timestamp with time zone,
    actual_end timestamp with time zone,
    break_minutes integer NOT NULL,
    status character varying(20) NOT NULL,
    notes text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    restaurant_id bigint NOT NULL,
    staff_id bigint NOT NULL,
    CONSTRAINT users_staffshift_break_minutes_check CHECK ((break_minutes >= 0))
);


ALTER TABLE public.users_staffshift OWNER TO ikan_bakar_user;

--
-- Name: users_staffshift_id_seq; Type: SEQUENCE; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE public.users_staffshift ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_staffshift_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add Bahan (Ingredient)	6	add_ingredient
22	Can change Bahan (Ingredient)	6	change_ingredient
23	Can delete Bahan (Ingredient)	6	delete_ingredient
24	Can view Bahan (Ingredient)	6	view_ingredient
25	Can add Kebersihan (Hygiene)	7	add_hygiene
26	Can change Kebersihan (Hygiene)	7	change_hygiene
27	Can delete Kebersihan (Hygiene)	7	delete_hygiene
28	Can view Kebersihan (Hygiene)	7	view_hygiene
29	Can add Perlengkapan (Supplies)	8	add_supplies
30	Can change Perlengkapan (Supplies)	8	change_supplies
31	Can delete Perlengkapan (Supplies)	8	delete_supplies
32	Can view Perlengkapan (Supplies)	8	view_supplies
33	Can add Lokasi Stok (Inventory Location)	9	add_inventorylocation
34	Can change Lokasi Stok (Inventory Location)	9	change_inventorylocation
35	Can delete Lokasi Stok (Inventory Location)	9	delete_inventorylocation
36	Can view Lokasi Stok (Inventory Location)	9	view_inventorylocation
37	Can add Item Stok (Stock Item)	10	add_stockitem
38	Can change Item Stok (Stock Item)	10	change_stockitem
39	Can delete Item Stok (Stock Item)	10	delete_stockitem
40	Can view Item Stok (Stock Item)	10	view_stockitem
41	Can add Pesanan (Order)	11	add_order
42	Can change Pesanan (Order)	11	change_order
43	Can delete Pesanan (Order)	11	delete_order
44	Can view Pesanan (Order)	11	view_order
45	Can add Meja (Table)	12	add_table
46	Can change Meja (Table)	12	change_table
47	Can delete Meja (Table)	12	delete_table
48	Can view Meja (Table)	12	view_table
49	Can add Menu dalam Pesanan (Dish in Order)	13	add_orderdish
50	Can change Menu dalam Pesanan (Dish in Order)	13	change_orderdish
51	Can delete Menu dalam Pesanan (Dish in Order)	13	delete_orderdish
52	Can view Menu dalam Pesanan (Dish in Order)	13	view_orderdish
53	Can add Pembayaran (Payment)	14	add_payment
54	Can change Pembayaran (Payment)	14	change_payment
55	Can delete Pembayaran (Payment)	14	delete_payment
56	Can view Pembayaran (Payment)	14	view_payment
57	Can add Transaksi Pembayaran (Payment Transaction)	15	add_paymenttransaction
58	Can change Transaksi Pembayaran (Payment Transaction)	15	change_paymenttransaction
59	Can delete Transaksi Pembayaran (Payment Transaction)	15	delete_paymenttransaction
60	Can view Transaksi Pembayaran (Payment Transaction)	15	view_paymenttransaction
61	Can add Kategori (Category)	16	add_category
62	Can change Kategori (Category)	16	change_category
63	Can delete Kategori (Category)	16	delete_category
64	Can view Kategori (Category)	16	view_category
65	Can add Menu (Dish)	17	add_dish
66	Can change Menu (Dish)	17	change_dish
67	Can delete Menu (Dish)	17	delete_dish
68	Can view Menu (Dish)	17	view_dish
69	Can add Bahan dalam Menu (Ingredient in Dish)	18	add_dishingredient
70	Can change Bahan dalam Menu (Ingredient in Dish)	18	change_dishingredient
71	Can delete Bahan dalam Menu (Ingredient in Dish)	18	delete_dishingredient
72	Can view Bahan dalam Menu (Ingredient in Dish)	18	view_dishingredient
73	Can add Modifier Group	19	add_modifiergroup
74	Can change Modifier Group	19	change_modifiergroup
75	Can delete Modifier Group	19	delete_modifiergroup
76	Can view Modifier Group	19	view_modifiergroup
77	Can add Modifier	20	add_modifier
78	Can change Modifier	20	change_modifier
79	Can delete Modifier	20	delete_modifier
80	Can view Modifier	20	view_modifier
81	Can add Dish Modifier Group	21	add_dishmodifiergroup
82	Can change Dish Modifier Group	21	change_dishmodifiergroup
83	Can delete Dish Modifier Group	21	delete_dishmodifiergroup
84	Can view Dish Modifier Group	21	view_dishmodifiergroup
85	Can add Modifier Ingredient Effect	22	add_modifieringredient
86	Can change Modifier Ingredient Effect	22	change_modifieringredient
87	Can delete Modifier Ingredient Effect	22	delete_modifieringredient
88	Can view Modifier Ingredient Effect	22	view_modifieringredient
89	Can add Restaurant	23	add_restaurant
90	Can change Restaurant	23	change_restaurant
91	Can delete Restaurant	23	delete_restaurant
92	Can view Restaurant	23	view_restaurant
93	Can add Staff Member	24	add_staffmember
94	Can change Staff Member	24	change_staffmember
95	Can delete Staff Member	24	delete_staffmember
96	Can view Staff Member	24	view_staffmember
97	Can add Staff Attendance	25	add_staffattendance
98	Can change Staff Attendance	25	change_staffattendance
99	Can delete Staff Attendance	25	delete_staffattendance
100	Can view Staff Attendance	25	view_staffattendance
101	Can add Staff Employment	26	add_staffemployment
102	Can change Staff Employment	26	change_staffemployment
103	Can delete Staff Employment	26	delete_staffemployment
104	Can view Staff Employment	26	view_staffemployment
105	Can add Staff Leave	27	add_staffleave
106	Can change Staff Leave	27	change_staffleave
107	Can delete Staff Leave	27	delete_staffleave
108	Can view Staff Leave	27	view_staffleave
109	Can add Staff Payroll	28	add_staffpayroll
110	Can change Staff Payroll	28	change_staffpayroll
111	Can delete Staff Payroll	28	delete_staffpayroll
112	Can view Staff Payroll	28	view_staffpayroll
113	Can add Staff Shift	29	add_staffshift
114	Can change Staff Shift	29	change_staffshift
115	Can delete Staff Shift	29	delete_staffshift
116	Can view Staff Shift	29	view_staffshift
117	Can add session	30	add_session
118	Can change session	30	change_session
119	Can delete session	30	delete_session
120	Can view session	30	view_session
121	Can add Cash Register	31	add_cashregister
122	Can change Cash Register	31	change_cashregister
123	Can delete Cash Register	31	delete_cashregister
124	Can view Cash Register	31	view_cashregister
125	Can add Register Session	32	add_registersession
126	Can change Register Session	32	change_registersession
127	Can delete Register Session	32	delete_registersession
128	Can view Register Session	32	view_registersession
129	Can add Register Alert	33	add_registeralert
130	Can change Register Alert	33	change_registeralert
131	Can delete Register Alert	33	delete_registeralert
132	Can view Register Alert	33	view_registeralert
133	Can add Cash Transaction	34	add_cashtransaction
134	Can change Cash Transaction	34	change_cashtransaction
135	Can delete Cash Transaction	34	delete_cashtransaction
136	Can view Cash Transaction	34	view_cashtransaction
137	Can add account	35	add_account
138	Can change account	35	change_account
139	Can delete account	35	delete_account
140	Can view account	35	view_account
141	Can add transaction	36	add_transaction
142	Can change transaction	36	change_transaction
143	Can delete transaction	36	delete_transaction
144	Can view transaction	36	view_transaction
145	Can add account group	37	add_accountgroup
146	Can change account group	37	change_accountgroup
147	Can delete account group	37	delete_accountgroup
148	Can view account group	37	view_accountgroup
149	Can add journal entry	38	add_journalentry
150	Can change journal entry	38	change_journalentry
151	Can delete journal entry	38	delete_journalentry
152	Can view journal entry	38	view_journalentry
153	Can add Restock Item	39	add_restockitem
154	Can change Restock Item	39	change_restockitem
155	Can delete Restock Item	39	delete_restockitem
156	Can view Restock Item	39	view_restockitem
157	Can add Restock Order	40	add_restockorder
158	Can change Restock Order	40	change_restockorder
159	Can delete Restock Order	40	delete_restockorder
160	Can view Restock Order	40	view_restockorder
161	Can add Stok Inventaris (Inventory Stock)	41	add_inventorystock
162	Can change Stok Inventaris (Inventory Stock)	41	change_inventorystock
163	Can delete Stok Inventaris (Inventory Stock)	41	delete_inventorystock
164	Can view Stok Inventaris (Inventory Stock)	41	view_inventorystock
165	Can add Expense	42	add_expense
166	Can change Expense	42	change_expense
167	Can delete Expense	42	delete_expense
168	Can view Expense	42	view_expense
169	Can add Expense Category	43	add_expensecategory
170	Can change Expense Category	43	change_expensecategory
171	Can delete Expense Category	43	delete_expensecategory
172	Can view Expense Category	43	view_expensecategory
173	Can add customer	44	add_customer
174	Can change customer	44	change_customer
175	Can delete customer	44	delete_customer
176	Can view customer	44	view_customer
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$1200000$y9DGKWPWrrhOSuLQeJFd7d$0iIEa8mw1MRKBpXemXHbLXpZLd23XqweRUKTUtVAKlY=	\N	f	Lis	Lis		lis@mail.com	t	t	2025-12-30 10:56:00+00
4	pbkdf2_sha256$1200000$zKMeIHJ25PKU135YB1eLEm$ssfYp0glJ/6l1JfTgpe9Bf987rh6VoiTD6uEbZH3uKo=	\N	f	Volan	Volan		volan@mail.com	t	t	2026-01-10 09:22:17+00
3	pbkdf2_sha256$1200000$74du755rozy1ebEPzcsI4s$DqlGzb0ZyVlEe1vz/mkoBndRjO04h/28szzGIa2fNh0=	\N	f	Mie	Mie		mie@mail.com	t	t	2026-01-10 09:20:38+00
6	pbkdf2_sha256$1200000$bKVksk0vcf0gZaqFcV6Lyj$fqYE/wV0i42deoT6u2Q9i363Wm8/Vxzwdo61LaxkW7M=	\N	f	Dean	Dean		dean@mail.com	t	t	2026-01-10 09:24:32+00
1	pbkdf2_sha256$1200000$MakxyZAqHN5zrLggUFqKh5$A0ocgbcs0XqQ7D3n0CLQXOBk5TNupnlCIVwkRJFv+3s=	2026-01-08 10:37:48+00	t	Anders	Anders	Hedborg	admin@ikanbakarkalianak.com	t	t	2025-12-28 12:29:44+00
7	pbkdf2_sha256$1200000$ZeUUsIHH10XmpEYAIUzQ9q$pPUPsoehPdo7wmsarQ7jVbUsPdsw6xIM840ovEVYQHs=	\N	t	Isna	Isna	Hedborg	isna@mail.com	t	t	2026-01-10 09:25:07+00
9	pbkdf2_sha256$1200000$YYcoZY8VjGqFCux3xj8Qu4$WMhzhFjDvYCm8sYgbaz7R9+e98BNmxi6eRqBvPfk650=	\N	t	Abdula	Abdula		abdula@mail.com	t	t	2026-01-10 09:39:12+00
5	pbkdf2_sha256$1200000$3Hoy2wgIupvoZH6Dxul1Q8$Lix7/tmbzuRie1NGteaATcVqYkLjC7FboIiwobWSYAo=	\N	f	Auntie	Auntie		auntie@mail.com	t	t	2026-01-10 09:23:09+00
11		\N	f	mock_customer				f	t	2026-01-27 15:19:42.477368+00
8	pbkdf2_sha256$1200000$uChhmtU9oXIbIRn6fCGgtw$9koygqL0CewVau5qZkWm97CTiI+UuLFTsDVItkYdX6k=	2026-01-18 09:52:42.254155+00	t	root			root@mail.com	t	t	2026-01-10 09:29:54.367961+00
10	pbkdf2_sha256$1200000$KYXTqRp05tF2XbPgU6Guq4$/1khBf3c3RagkFW+hkcDZxYqwlzjI8/TgmY4ybk+dpg=	2026-02-18 10:49:15.02049+00	t	admin			admin@ikanbakarkalianak.com	t	t	2026-01-17 08:30:29.942372+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: bank_account; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.bank_account (id, name, restaurant_id, code, group_id) FROM stdin;
6	Cash Drawer	1		1
7	BCA Account	1		1
8	QRIS Clearing	1		1
9	Food Sales	1		2
10	Inventory Purchase	1		3
11	Operational Expense	1		3
12	Staff Salary Expense	1		3
13	Rent Expense	1		3
14	Utilities Expense	1		3
15	Maintenance Expense	1		3
16	Marketing Expense	1		3
17	Tax Expense	1		3
\.


--
-- Data for Name: bank_accountgroup; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.bank_accountgroup (id, name, type) FROM stdin;
1	Default ASSET	ASSET
2	Default REVENUE	REVENUE
3	Default EXPENSE	EXPENSE
\.


--
-- Data for Name: bank_journalentry; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.bank_journalentry (id, debit, credit, account_id, transaction_id) FROM stdin;
19	94000.00	0.00	6	14
20	0.00	94000.00	9	14
21	134280.00	0.00	10	15
22	0.00	134280.00	6	15
23	261000.00	0.00	10	16
24	0.00	261000.00	6	16
25	1600000.00	0.00	12	17
26	0.00	1600000.00	8	17
27	1600000.00	0.00	12	18
28	0.00	1600000.00	8	18
29	400000.00	0.00	17	19
30	0.00	400000.00	7	19
\.


--
-- Data for Name: bank_transaction; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.bank_transaction (id, date, description, related_order_id, restaurant_id) FROM stdin;
13	2026-01-21 11:03:49.861381+00	Expense: Inventory Purchase	\N	1
10	2026-01-08 02:12:34.380973+00	Payment for Order #Pesan-37	\N	1
11	2026-01-09 09:44:37.960269+00	Payment for Order #Pesan-38	\N	1
12	2026-01-17 09:02:11.717947+00	Payment for Order #Pesan-45	\N	1
14	2026-01-21 12:27:26.463334+00	Payment for Order #Pesan-50	50	1
15	2026-01-21 13:17:30.391758+00	Restock #18: Beras x9.00	\N	1
16	2026-01-21 13:21:06.301531+00	Restock #19: Sendok Putih x22.00, Ayam x5.00	\N	1
17	2026-01-21 13:22:29.138221+00	Salary for Auntie (2026-01-01 to 2026-01-21)	\N	1
18	2026-02-04 11:38:09.09468+00	Salary for Auntie (2026-02-01 to 2026-02-04)	\N	1
19	2026-02-04 11:52:53.077543+00	Expense: Tax	\N	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2025-12-28 13:27:47.582361+00	1	Restaurant 1	1	[{"added": {}}]	23	1
2	2025-12-28 13:28:06.794503+00	2	Restaurant 2	1	[{"added": {}}]	23	1
3	2025-12-28 13:28:28.022728+00	1	Meja 1	1	[{"added": {}}]	12	1
4	2025-12-28 13:28:32.252263+00	2	Meja 2	1	[{"added": {}}]	12	1
5	2025-12-28 13:51:06.290785+00	1	Ikan Bakar Gurami (Kepala)	2	[{"changed": {"fields": ["Image"]}}]	17	1
6	2025-12-28 13:51:58.097454+00	2	Ikan Bakar Gurami (Ekor)	2	[{"changed": {"fields": ["Image"]}}]	17	1
7	2025-12-28 13:52:25.060736+00	3	Ikan Bakar Gurami (Badan)	2	[{"changed": {"fields": ["Image"]}}, {"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan) \\u2013 0.2kg Ikan Segar"}}]	17	1
8	2025-12-28 13:52:50.764317+00	3	Ikan Bakar Gurami (Badan)	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan) \\u2013 0.1kg Telur"}}]	17	1
9	2025-12-28 13:53:20.976468+00	2	Ikan Bakar Gurami (Ekor)	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) \\u2013 0.2kg Ikan Segar"}}, {"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) \\u2013 0.1kg Telur"}}]	17	1
10	2025-12-28 13:53:40.827763+00	1	Ikan Bakar Gurami (Kepala)	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) \\u2013 0.2kg Ikan Segar"}}, {"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) \\u2013 0.1kg Telur"}}]	17	1
11	2025-12-28 15:09:45.858122+00	17	Dadar Jagung	2	[{"changed": {"fields": ["Image"]}}]	17	1
12	2025-12-28 15:10:52.970627+00	16	Kacang Goreng	2	[{"changed": {"fields": ["Image"]}}]	17	1
13	2025-12-28 15:11:36.933611+00	13	Kerupuk Rambak	2	[{"changed": {"fields": ["Image"]}}]	17	1
14	2025-12-28 15:11:52.489485+00	14	Kerupuk Putih	2	[{"changed": {"fields": ["Image"]}}]	17	1
15	2025-12-28 15:12:01.520424+00	15	Kerupuk Puli	2	[{"changed": {"fields": ["Image"]}}]	17	1
16	2025-12-28 15:12:34.714371+00	10	Pisang Goreng	2	[{"changed": {"fields": ["Image"]}}]	17	1
17	2025-12-28 15:13:01.447458+00	11	Nasi Putih	2	[{"changed": {"fields": ["Image"]}}]	17	1
18	2025-12-28 15:15:07.145973+00	12	Kerupuk Udang	2	[{"changed": {"fields": ["Image"]}}]	17	1
19	2025-12-28 15:21:47.145151+00	7	Cah Kangkung	2	[{"changed": {"fields": ["Image"]}}]	17	1
20	2025-12-28 15:22:04.730159+00	8	Sayur Bayam	2	[{"changed": {"fields": ["Image"]}}]	17	1
21	2025-12-28 15:22:22.683215+00	9	Sambal Pencit	2	[{"changed": {"fields": ["Image"]}}]	17	1
22	2025-12-28 15:25:37.463894+00	4	Ayam Kampung Bakar	2	[{"changed": {"fields": ["Image"]}}]	17	1
23	2025-12-28 15:25:56.538438+00	5	Terong Goreng Penyet	2	[{"changed": {"fields": ["Image"]}}]	17	1
24	2025-12-28 15:26:17.736419+00	6	Sayur Urap	2	[{"changed": {"fields": ["Image"]}}]	17	1
25	2025-12-29 01:06:21.02006+00	1	Ikan Segar (15.00kg)	2	[{"changed": {"fields": ["Price"]}}]	6	1
26	2025-12-29 01:07:16.59685+00	1	Ikan Segar (15.00kg)	2	[{"changed": {"fields": ["Price"]}}]	6	1
27	2025-12-29 01:08:17.911492+00	3	Telur (30.00kg)	2	[{"changed": {"fields": ["Price"]}}]	6	1
28	2025-12-29 08:55:16.156901+00	4	Snacks	1	[{"added": {}}]	16	1
29	2025-12-29 08:59:47.846126+00	3	Pendamping	2	[{"changed": {"fields": ["Name"]}}]	16	1
30	2025-12-29 09:00:05.690254+00	13	Kerupuk Rambak	2	[{"changed": {"fields": ["Category"]}}]	17	1
31	2025-12-29 09:00:18.754992+00	15	Kerupuk Puli	2	[{"changed": {"fields": ["Category"]}}]	17	1
32	2025-12-29 09:00:26.23523+00	14	Kerupuk Putih	2	[{"changed": {"fields": ["Category"]}}]	17	1
33	2025-12-29 09:00:35.124229+00	12	Kerupuk Udang	2	[{"changed": {"fields": ["Category"]}}]	17	1
34	2025-12-29 09:05:31.040408+00	18	Air mineral	1	[{"added": {}}]	17	1
35	2025-12-30 09:55:57.943526+00	61	Sambal (0kg)	1	[{"added": {}}]	6	1
36	2025-12-30 10:11:00.948124+00	3	ORD-20251230034711	3		11	1
37	2025-12-30 10:11:00.94817+00	2	ORD-20251229091418	3		11	1
38	2025-12-30 10:11:00.948186+00	1	ORD-20251229085333	3		11	1
39	2025-12-30 10:23:41.438953+00	5	ORD-20251230101913-885698	3		11	1
40	2025-12-30 10:39:23.29363+00	3	Ikan Bakar Gurami (Badan)	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan) \\u2013 0.10kg Sambal", "fields": ["Ingredient"]}}]	17	1
41	2025-12-30 10:39:58.824947+00	2	Ikan Bakar Gurami (Ekor)	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) \\u2013 0.10kg Sambal", "fields": ["Ingredient"]}}]	17	1
42	2025-12-30 10:40:21.37036+00	1	Ikan Bakar Gurami (Kepala)	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) \\u2013 0.10kg Sambal", "fields": ["Ingredient"]}}]	17	1
43	2025-12-30 10:56:00.496177+00	2	Lis	1	[{"added": {}}]	4	1
44	2025-12-30 10:56:15.177058+00	2	Lis	2	[{"changed": {"fields": ["Staff status"]}}]	4	1
45	2025-12-30 11:15:30.501615+00	4	ORD-20251230101730-266643	3		11	1
46	2025-12-30 11:15:30.50166+00	6	ORD-20251230102509-800330	3		11	1
47	2025-12-30 11:15:30.501674+00	7	ORD-20251230103712-940966	3		11	1
48	2025-12-30 11:15:30.501685+00	8	ORD-20251230110756-943919	3		11	1
49	2025-12-30 11:15:30.501694+00	9	ORD-20251230111346-934867	3		11	1
50	2026-01-04 14:23:43.411379+00	13	ORD-20251230223615-970328	3		11	1
51	2026-01-04 14:23:43.411451+00	12	ORD-20251230112453-557330	3		11	1
52	2026-01-04 14:23:43.41147+00	11	ORD-20251230111631-116080	3		11	1
53	2026-01-04 14:23:43.411482+00	10	ORD-20251230111551-752085	3		11	1
54	2026-01-04 14:30:07.01624+00	15	ORD-20260104142411-283819	3		11	1
55	2026-01-04 14:30:07.016283+00	14	ORD-20260104142403-615443	3		11	1
56	2026-01-05 02:12:56.272527+00	19	test	1	[{"added": {}}]	17	1
57	2026-01-05 12:42:07.267707+00	5	Kacang Tanah Goreng (15.00paket)	3		8	1
58	2026-01-05 12:42:07.267756+00	8	Kecap manis (Curah) (1000.00ml)	3		8	1
59	2026-01-05 12:42:07.267769+00	4	Kerupuk Puli (25.00paket)	3		8	1
60	2026-01-05 12:42:07.267778+00	3	Kerupuk Putih (30.00paket)	3		8	1
61	2026-01-05 12:42:07.267787+00	2	Kerupuk Rambak (20.00paket)	3		8	1
62	2026-01-05 12:42:07.267797+00	1	Kerupuk Udang (25.00paket)	3		8	1
63	2026-01-05 12:42:07.267806+00	11	Mentega (Kemasan kecil) (1000.00g)	3		8	1
64	2026-01-05 12:42:07.267814+00	10	Minyak (Curah) (1000.00ml)	3		8	1
65	2026-01-05 12:42:07.267823+00	6	Sambal Pencit (Kemasan) (10.00paket)	3		8	1
66	2026-01-05 12:42:07.267831+00	9	Saus asin (1000.00ml)	3		8	1
67	2026-01-05 12:42:07.26784+00	7	Sirup (1000.00ml)	3		8	1
68	2026-01-05 12:58:29.154888+00	12	Sendok Putih (60pcs)	1	[{"added": {}}]	8	1
69	2026-01-05 20:19:53.911618+00	19	test	3		17	1
70	2026-01-07 10:39:06.416594+00	61	Sambal (0.00kg)	2	[{"changed": {"fields": ["Image"]}}]	6	1
71	2026-01-07 10:40:06.563124+00	61	Sambal (30kg)	2	[{"changed": {"fields": ["Stock", "Max stock"]}}]	6	1
72	2026-01-07 10:41:27.221972+00	1	Ikan Segar (14.40kg)	2	[{"changed": {"fields": ["Image"]}}]	6	1
73	2026-01-07 10:42:36.036437+00	2	Ayam (17.00kg)	2	[{"changed": {"fields": ["Name", "Restaurant", "Image"]}}]	6	1
74	2026-01-07 10:43:23.334671+00	3	Telur (29.70kg)	2	[{"changed": {"fields": ["Restaurant", "Image"]}}]	6	1
75	2026-01-07 10:45:34.793087+00	1	Ikan Segar (14.40kg)	2	[{"changed": {"fields": ["Restaurant"]}}]	6	1
76	2026-01-07 15:51:12.819269+00	8	RestockOrder object (8)	3		40	1
77	2026-01-07 16:02:19.045698+00	9	RestockOrder object (9)	3		40	1
78	2026-01-07 16:02:19.045742+00	7	RestockOrder object (7)	3		40	1
79	2026-01-07 16:02:19.045755+00	6	RestockOrder object (6)	3		40	1
80	2026-01-07 16:02:19.045765+00	5	RestockOrder object (5)	3		40	1
81	2026-01-07 16:02:19.045774+00	4	RestockOrder object (4)	3		40	1
82	2026-01-07 16:02:19.045783+00	3	RestockOrder object (3)	3		40	1
83	2026-01-07 16:02:19.045793+00	2	RestockOrder object (2)	3		40	1
84	2026-01-07 16:02:19.045803+00	1	RestockOrder object (1)	3		40	1
85	2026-01-07 16:06:50.722059+00	10	RestockOrder object (10)	3		40	1
86	2026-01-07 16:26:21.065952+00	11	RestockOrder object (11)	3		40	1
87	2026-01-07 22:35:32.963321+00	4	Ayam Kampung Bakar	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ayam Kampung Bakar \\u2013 0.2kg Beras"}}]	17	1
88	2026-01-07 22:36:37.082251+00	4	Beras	2	[{"changed": {"fields": ["Price"]}}]	6	1
89	2026-01-07 22:52:10.605946+00	5	Arang Kayu	2	[{"changed": {"fields": ["Image"]}}]	6	1
90	2026-01-07 22:52:41.755889+00	4	Beras	2	[{"changed": {"fields": ["Image"]}}]	6	1
91	2026-01-07 22:56:57.784554+00	6	Minyak Goreng	2	[{"changed": {"fields": ["Image"]}}]	6	1
92	2026-01-07 22:57:15.164686+00	7	Minyak Kelapa	2	[{"changed": {"fields": ["Image"]}}]	6	1
93	2026-01-07 23:32:53.535695+00	55	Asam Jawa	2	[{"changed": {"fields": ["Image"]}}]	6	1
94	2026-01-07 23:48:12.00993+00	20	Bawang Goreng	2	[{"changed": {"fields": ["Image"]}}]	6	1
95	2026-01-07 23:48:34.773537+00	18	Bawang Merah	2	[{"changed": {"fields": ["Image"]}}]	6	1
96	2026-01-07 23:49:08.015786+00	19	Bawang Putih	2	[{"changed": {"fields": ["Image"]}}]	6	1
97	2026-01-07 23:52:14.410013+00	4	Beras	2	[{"changed": {"fields": ["Price"]}}]	6	1
98	2026-01-07 23:53:25.534321+00	30	Tepung Terigu	2	[{"changed": {"fields": ["Image"]}}]	6	1
99	2026-01-07 23:54:07.083127+00	60	Nastar	2	[{"changed": {"fields": ["Image"]}}]	6	1
100	2026-01-07 23:55:16.698296+00	30	Tepung Terigu	2	[{"changed": {"fields": ["Price"]}}]	6	1
101	2026-01-07 23:56:05.964939+00	10	Gula	2	[{"changed": {"fields": ["Image"]}}]	6	1
102	2026-01-07 23:56:19.06891+00	12	Gula Aren	2	[{"changed": {"fields": ["Image"]}}]	6	1
103	2026-01-07 23:56:37.538803+00	11	Gula Merah	2	[{"changed": {"fields": ["Image"]}}]	6	1
104	2026-01-07 23:57:08.882735+00	10	Gula	2	[{"changed": {"fields": ["Price"]}}]	6	1
105	2026-01-07 23:58:45.043111+00	6	Minyak (RF Fortune)	2	[{"changed": {"fields": ["Name", "Price"]}}]	6	1
106	2026-01-08 00:03:25.227359+00	17	Saori Tiram	2	[{"changed": {"fields": ["Name", "Price", "Image"]}}]	6	1
107	2026-01-08 01:21:36.552296+00	21	Jeruk Manis Es	2	[{"changed": {"fields": ["Image"]}}]	17	1
108	2026-01-08 01:21:53.106919+00	20	Jus Alpukat	2	[{"changed": {"fields": ["Image"]}}]	17	1
109	2026-01-08 01:22:11.422553+00	22	Es Teh Manis	2	[{"changed": {"fields": ["Image"]}}]	17	1
110	2026-01-08 01:22:24.737977+00	24	Es Cendol	2	[{"changed": {"fields": ["Image"]}}]	17	1
111	2026-01-08 01:22:45.699045+00	23	Es Kelapa Muda	2	[{"changed": {"fields": ["Image"]}}]	17	1
112	2026-01-08 01:41:32.8738+00	6	2026-01-04 - Payment for Order #ORD-20260104150723-891563	3		36	1
113	2026-01-08 01:41:32.873836+00	5	2026-01-04 - Payment for Order #ORD-20260104143019-33911	3		36	1
114	2026-01-08 01:41:32.873855+00	4	2025-12-30 - Payment for Order #ORD-20251230111551-752085	3		36	1
115	2026-01-08 01:41:32.873872+00	3	2025-12-30 - Payment for Order #ORD-20251230110756-943919	3		36	1
116	2026-01-08 01:41:32.873889+00	2	2025-12-30 - Payment for Order #ORD-20251230103712-940966	3		36	1
117	2026-01-08 01:41:32.873905+00	1	2025-12-30 - Payment for Order #ORD-20251230101730-266643	3		36	1
118	2026-01-08 01:43:53.127666+00	8	2026-01-08 - Payment for Order #Pesan-35	3		36	1
119	2026-01-08 01:43:53.127731+00	7	2026-01-08 - Payment for Order #Pesan-34	3		36	1
120	2026-01-08 01:44:51.967008+00	35	Pesan-35	3		11	1
121	2026-01-08 01:44:51.967068+00	34	Pesan-34	3		11	1
122	2026-01-08 01:44:51.967084+00	33	Pesan-33	3		11	1
123	2026-01-08 01:44:51.967097+00	32	Pesan-32	3		11	1
124	2026-01-08 01:44:51.967134+00	31	Pesan-31	3		11	1
125	2026-01-08 01:44:51.967147+00	30	Pesan-30	3		11	1
126	2026-01-08 01:44:51.967159+00	29	Pesan-29	3		11	1
127	2026-01-08 01:44:51.967171+00	28	Pesan-28	3		11	1
128	2026-01-08 01:44:51.967182+00	27	ORD-20260106010319-638095	3		11	1
129	2026-01-08 01:44:51.967195+00	26	ORD-20260105133115-544522	3		11	1
130	2026-01-08 01:44:51.967207+00	25	ORD-20260105110539-344211	3		11	1
131	2026-01-08 01:44:51.967219+00	24	ORD-20260105034108-969777	3		11	1
132	2026-01-08 01:44:51.967231+00	23	ORD-20260105034006-83621	3		11	1
133	2026-01-08 01:44:51.967242+00	22	ORD-20260105033245-962536	3		11	1
134	2026-01-08 01:44:51.967254+00	21	ORD-20260105032946-468211	3		11	1
135	2026-01-08 01:44:51.967266+00	20	ORD-20260105032908-577910	3		11	1
136	2026-01-08 01:44:51.967278+00	19	ORD-20260105032856-469425	3		11	1
137	2026-01-08 01:44:51.96729+00	18	ORD-20260105030947-272786	3		11	1
138	2026-01-08 01:44:51.967302+00	17	ORD-20260104150723-891563	3		11	1
139	2026-01-08 01:44:51.967314+00	16	ORD-20260104143019-33911	3		11	1
140	2026-01-08 01:46:43.906384+00	36	Pesan-36	3		11	1
141	2026-01-08 01:47:12.773412+00	9	2026-01-08 - Payment for Order #Pesan-36	3		36	1
142	2026-01-09 09:58:21.835987+00	42	Pesan-42	3		11	1
143	2026-01-09 09:58:21.836026+00	41	Pesan-41	3		11	1
144	2026-01-09 09:58:21.836048+00	40	Pesan-40	3		11	1
145	2026-01-09 09:58:21.836067+00	39	Pesan-39	3		11	1
146	2026-01-09 10:26:17.88197+00	44	Pesan-44	3		11	1
147	2026-01-09 10:26:17.88206+00	43	Pesan-43	3		11	1
148	2026-01-10 02:13:28.847675+00	1	admin (Administrator) - Restaurant 1	2	[{"changed": {"fields": ["Image"]}}]	24	1
149	2026-01-10 02:18:12.187587+00	2	Lis (Staff) - Restaurant 1	1	[{"added": {}}]	24	1
150	2026-01-10 02:18:30.682778+00	1	admin (Administrator) - Restaurant 1	2	[{"changed": {"fields": ["Image"]}}]	24	1
151	2026-01-10 02:19:05.488263+00	2	Lis (Staff) - Restaurant 1	2	[{"changed": {"fields": ["Image"]}}]	24	1
152	2026-01-10 09:20:38.853903+00	3	Mie	1	[{"added": {}}]	4	1
153	2026-01-10 09:21:30.746737+00	3	Mie	2	[{"changed": {"fields": ["First name", "Email address"]}}]	4	1
154	2026-01-10 09:21:54.425681+00	2	Lis	2	[{"changed": {"fields": ["First name", "Email address"]}}]	4	1
155	2026-01-10 09:22:17.89785+00	4	Volan	1	[{"added": {}}]	4	1
156	2026-01-10 09:22:41.749172+00	4	Volan	2	[{"changed": {"fields": ["First name", "Email address", "Staff status"]}}]	4	1
157	2026-01-10 09:23:10.40535+00	5	Auntie	1	[{"added": {}}]	4	1
158	2026-01-10 09:23:43.769889+00	5	Auntie	2	[{"changed": {"fields": ["First name", "Email address", "Staff status"]}}]	4	1
159	2026-01-10 09:23:57.510605+00	3	Mie	2	[{"changed": {"fields": ["Staff status"]}}]	4	1
160	2026-01-10 09:24:04.635434+00	3	Mie	2	[]	4	1
161	2026-01-10 09:24:32.893134+00	6	Dean	1	[{"added": {}}]	4	1
162	2026-01-10 09:24:49.252943+00	6	Dean	2	[{"changed": {"fields": ["First name", "Email address", "Staff status"]}}]	4	1
163	2026-01-10 09:25:07.977261+00	7	Isna	1	[{"added": {}}]	4	1
164	2026-01-10 09:25:32.928461+00	7	Isna	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Superuser status"]}}]	4	1
165	2026-01-10 09:26:53.193795+00	3	Auntie (Staff) - Restaurant 1	1	[{"added": {}}]	24	1
166	2026-01-10 09:27:57.075157+00	1	Anders	2	[{"changed": {"fields": ["Username", "First name", "Last name", "Staff status"]}}]	4	1
167	2026-01-10 09:30:30.915289+00	1	Anders	2	[{"changed": {"fields": ["Staff status"]}}]	4	8
168	2026-01-10 09:30:40.084406+00	7	Isna	2	[{"changed": {"fields": ["Staff status"]}}]	4	8
169	2026-01-10 09:36:27.461489+00	4	Dean (Staff) - Restaurant 1	1	[{"added": {}}]	24	8
170	2026-01-10 09:37:05.184157+00	5	Isna (Administrator) - Restaurant 1	1	[{"added": {}}]	24	8
171	2026-01-10 09:37:47.739446+00	6	Volan (Staff) - Restaurant 1	1	[{"added": {}}]	24	8
172	2026-01-10 09:38:19.6591+00	2	Lis (Staff) - Restaurant 1	2	[{"changed": {"fields": ["Image"]}}]	24	8
173	2026-01-10 09:38:49.965196+00	7	Mie (Staff) - Restaurant 1	1	[{"added": {}}]	24	8
174	2026-01-10 09:39:12.94703+00	9	Abdula	1	[{"added": {}}]	4	8
175	2026-01-10 09:39:35.063749+00	9	Abdula	2	[{"changed": {"fields": ["First name", "Email address", "Staff status", "Superuser status"]}}]	4	8
176	2026-01-10 09:39:56.513601+00	8	Abdula (Administrator) - Restaurant 1	1	[{"added": {}}]	24	8
177	2026-01-10 09:42:36.062221+00	3	Ikan Bakar Gurami (Badan)	2	[{"deleted": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan) \\u2013 0.10kg Sambal"}}]	17	8
178	2026-01-10 09:44:51.332369+00	3	Ikan Bakar Gurami (Badan)	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan) \\u2013 0.05kg Beras"}}]	17	8
179	2026-01-10 09:46:03.604021+00	3	Ikan Bakar Gurami (Badan)	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan) \\u2013 0.25kg Ikan Segar", "fields": ["Amount"]}}]	17	8
180	2026-01-10 09:50:02.467523+00	25	Es Beras Kencur	1	[{"added": {}}]	17	8
181	2026-01-10 09:51:53.142709+00	26	Es Beras Kencur (Tampa Es)	1	[{"added": {}}]	17	8
182	2026-01-10 09:53:01.712409+00	24	Es Cendol	3		17	8
183	2026-01-10 09:53:01.712443+00	23	Es Kelapa Muda	3		17	8
184	2026-01-10 09:53:01.712461+00	20	Jus Alpukat	3		17	8
185	2026-01-10 09:53:40.924023+00	22	Teh Manis (Es/Panas)	2	[{"changed": {"fields": ["Name"]}}]	17	8
186	2026-01-10 09:55:05.855777+00	27	Es Beras Kencur Jumbo	1	[{"added": {}}]	17	8
187	2026-01-10 09:56:10.62063+00	28	Beras Kencur (Botol kecil)	1	[{"added": {}}]	17	8
188	2026-01-10 09:57:04.812908+00	29	Beras Kencur (Botol 1,5L)	1	[{"added": {}}]	17	8
189	2026-01-10 09:57:37.325801+00	30	Es Cao Susu	1	[{"added": {}}]	17	8
190	2026-01-10 09:58:02.875347+00	31	Es Cao	1	[{"added": {}}]	17	8
191	2026-01-10 09:58:43.481994+00	32	Teh Tawar (Es/Panas)	1	[{"added": {}}]	17	8
192	2026-01-10 09:59:31.628901+00	33	Teh Manis (Jumbo)	1	[{"added": {}}]	17	8
193	2026-01-10 10:00:05.638983+00	34	Teh Tawar (Jumbo)	1	[{"added": {}}]	17	8
194	2026-01-10 10:00:45.28678+00	21	Es Jeruk Manis	2	[{"changed": {"fields": ["Name", "Price"]}}]	17	8
195	2026-01-10 10:01:16.987692+00	35	Es Jeruk Manis (Jumbo)	1	[{"added": {}}]	17	8
196	2026-01-10 10:02:29.892393+00	36	Teh Botol Sosro	1	[{"added": {}}]	17	8
197	2026-01-10 10:03:16.373855+00	37	Teh Pucuk Harum	1	[{"added": {}}]	17	8
198	2026-01-10 10:03:30.820426+00	18	Air mineral	2	[{"changed": {"fields": ["Price"]}}]	17	8
199	2026-01-10 10:03:56.524377+00	38	Air Panas	1	[{"added": {}}]	17	8
200	2026-01-10 10:04:20.581346+00	39	Es Batu	1	[{"added": {}}]	17	8
201	2026-01-10 10:06:04.986114+00	3	Ikan Bakar Gurami (Badan) + Nasi	2	[{"changed": {"fields": ["Name", "Price"]}}]	17	8
202	2026-01-10 10:07:02.540913+00	2	Ikan Bakar Gurami (Ekor) + Nasi	2	[{"changed": {"fields": ["Name", "Price"]}}, {"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) + Nasi \\u2013 0.05kg Beras"}}, {"deleted": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) + Nasi \\u2013 0.05kg Sambal"}}]	17	8
203	2026-01-10 10:07:36.982887+00	1	Ikan Bakar Gurami (Kepala) + Nasi	2	[{"changed": {"fields": ["Name", "Price"]}}, {"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) + Nasi \\u2013 0.05kg Beras"}}, {"deleted": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) + Nasi \\u2013 0.10kg Sambal"}}]	17	8
204	2026-01-10 10:07:43.281713+00	2	Ikan Bakar Gurami (Ekor) + Nasi	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) + Nasi \\u2013 0.05kg Beras", "fields": ["Unit"]}}]	17	8
205	2026-01-10 10:07:53.723555+00	1	Ikan Bakar Gurami (Kepala) + Nasi	2	[{"changed": {"fields": ["Price"]}}]	17	8
206	2026-01-10 10:08:44.465983+00	3	Ikan Bakar Gurami (Badan) + Nasi	2	[{"changed": {"fields": ["Description"]}}]	17	8
207	2026-01-10 10:09:43.330982+00	40	Ikan Bakar Gurami (Kepala)	1	[{"added": {}}, {"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) \\u2013 0.25kg Ikan Segar"}}, {"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) \\u2013 0.05kg Beras"}}]	17	8
208	2026-01-10 10:10:50.771568+00	41	Ikan Bakar Gurami (Ekor)	1	[{"added": {}}, {"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) \\u2013 0.25kg Ikan Segar"}}, {"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) \\u2013 0.05kg Beras"}}]	17	8
209	2026-01-10 10:11:37.049648+00	40	Ikan Bakar Gurami (Kepala)	2	[{"changed": {"fields": ["Image"]}}]	17	8
210	2026-01-10 10:17:15.398873+00	42	Ikan Bakar Gurami (Badan)	1	[{"added": {}}, {"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan) \\u2013 0.25kg Ikan Segar"}}]	17	8
211	2026-01-10 10:18:58.181281+00	42	Ikan Bakar Gurami (Badan)	2	[{"changed": {"fields": ["Category"]}}, {"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan) \\u2013 0.05kg Beras"}}]	17	8
310	2026-01-21 11:10:27.982905+00	13	QRIS Clearing: Dr 7000.00 | Cr 0.00	3		38	8
212	2026-01-10 10:21:04.903964+00	4	Ayam Kampung Bakar	2	[{"changed": {"fields": ["Price"]}}, {"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ayam Kampung Bakar \\u2013 0.25kg Ayam", "fields": ["Ingredient", "Amount"]}}]	17	8
213	2026-01-10 10:22:24.218201+00	43	Ayam Kampung Bakar (+ Nasi)	1	[{"added": {}}, {"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ayam Kampung Bakar (+ Nasi) \\u2013 0.25kg Ayam"}}, {"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ayam Kampung Bakar (+ Nasi) \\u2013 0.1kg Beras"}}]	17	8
214	2026-01-10 10:25:34.867224+00	44	Paket Kotak Ikan Gurami Bakar	1	[{"added": {}}]	17	8
215	2026-01-10 10:27:54.238385+00	45	Paket Kotak Ayam Bakar	1	[{"added": {}}]	17	8
216	2026-01-10 10:34:30.884871+00	5	Lainnya	1	[{"added": {}}]	16	8
217	2026-01-10 10:34:59.52056+00	6	Sayuran	1	[{"added": {}}]	16	8
218	2026-01-10 10:37:27.783876+00	11	Nasi Putih	2	[{"changed": {"fields": ["Category"]}}]	17	8
219	2026-01-10 10:37:54.01546+00	10	Pisang Goreng	2	[{"changed": {"fields": ["Category", "Price"]}}]	17	8
220	2026-01-10 10:38:59.206335+00	9	Extra Sambal Mangga	2	[{"changed": {"fields": ["Name", "Price", "Description"]}}]	17	8
221	2026-01-10 10:39:10.307436+00	9	Extra Sambal Mangga	2	[{"changed": {"fields": ["Category"]}}]	17	8
222	2026-01-10 10:39:56.784573+00	8	Sayur Urap-Urap	2	[{"changed": {"fields": ["Name", "Price", "Description"]}}]	17	8
223	2026-01-10 10:40:03.840664+00	8	Sayur Urap-Urap	2	[{"changed": {"fields": ["Category"]}}]	17	8
224	2026-01-10 10:40:32.871608+00	7	Cah Kangkung	3		17	8
225	2026-01-10 10:40:32.871636+00	6	Sayur Urap	3		17	8
226	2026-01-10 10:40:32.871649+00	5	Terong Goreng Penyet	3		17	8
227	2026-01-10 10:41:05.207181+00	17	Dadar Jagung	2	[{"changed": {"fields": ["Category", "Price"]}}]	17	8
228	2026-01-10 10:41:35.909124+00	16	Kacang Goreng	2	[{"changed": {"fields": ["Category", "Price"]}}]	17	8
229	2026-01-10 10:41:48.659183+00	4	Snack	2	[{"changed": {"fields": ["Name"]}}]	16	8
230	2026-01-10 10:42:27.918262+00	3	Pendamping	3		16	8
231	2026-01-10 10:43:34.192656+00	46	Paket Kotak Ikan Gurami Bakar (Kapala)	1	[{"added": {}}]	17	8
232	2026-01-10 10:43:59.877745+00	46	Paket Kotak Ikan Gurami Bakar (Kepala)	2	[{"changed": {"fields": ["Name"]}}]	17	8
233	2026-01-10 10:44:24.5813+00	46	Paket Kotak Ikan Gurami Bakar (Kepala)	2	[{"changed": {"fields": ["Price"]}}]	17	8
234	2026-01-10 10:45:16.56491+00	44	Paket Kotak Ikan Gurami Bakar (Ekor)	2	[{"changed": {"fields": ["Name"]}}]	17	8
235	2026-01-10 10:45:42.417537+00	47	Paket Kotak Ikan Gurami Bakar (Ekor)	1	[{"added": {}}]	17	8
236	2026-01-10 10:46:30.035874+00	3	Ikan Bakar Gurami (Badan + Nasi)	2	[{"changed": {"fields": ["Name"]}}]	17	8
237	2026-01-10 10:47:13.847803+00	15	Kerupuk Puli	2	[{"changed": {"fields": ["Price"]}}]	17	8
238	2026-01-10 10:47:26.614481+00	14	Kerupuk Putih	2	[{"changed": {"fields": ["Price"]}}]	17	8
239	2026-01-10 10:47:39.645875+00	13	Kerupuk Rambak	2	[{"changed": {"fields": ["Price"]}}]	17	8
240	2026-01-10 10:48:29.435865+00	48	Melinjo Manis	1	[{"added": {}}]	17	8
241	2026-01-10 10:49:17.915663+00	49	Kerupuk Blek	1	[{"added": {}}]	17	8
242	2026-01-10 10:49:45.961807+00	50	Usus Ayam	1	[{"added": {}}]	17	8
243	2026-01-10 21:27:38.217307+00	51	Tahu Telur	1	[{"added": {}}]	17	8
244	2026-01-10 21:30:14.704575+00	52	Extra Lalapan	1	[{"added": {}}]	17	8
245	2026-01-10 23:42:42.772359+00	60	Nastar	2	[{"changed": {"fields": ["Image"]}}]	6	8
246	2026-01-12 11:35:04.747104+00	1	Ikan Segar	2	[{"changed": {"fields": ["Price"]}}]	6	8
247	2026-01-12 11:36:50.187323+00	3	Ikan Bakar Gurami (Badan + Nasi)	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan + Nasi) \\u2013 0.05kg Beras", "fields": ["Unit"]}}]	17	8
248	2026-01-12 11:38:51.915963+00	3	Ikan Bakar Gurami (Badan + Nasi)	2	[]	17	8
249	2026-01-12 11:43:05.571725+00	14	Kecap Manis	2	[{"changed": {"fields": ["Price"]}}]	6	8
250	2026-01-12 11:45:12.070012+00	2	Ikan Bakar Gurami (Ekor) + Nasi	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) + Nasi \\u2013 0.25kg Ikan Segar", "fields": ["Amount"]}}]	17	8
251	2026-01-12 11:45:20.165672+00	1	Ikan Bakar Gurami (Kepala) + Nasi	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) + Nasi \\u2013 0.25kg Ikan Segar", "fields": ["Amount"]}}]	17	8
252	2026-01-13 01:36:44.2022+00	3	Ikan Bakar Gurami (Badan + Nasi)	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan + Nasi) \\u2013 0.1kg Beras", "fields": ["Amount"]}}]	17	8
253	2026-01-13 01:36:52.336263+00	2	Ikan Bakar Gurami (Ekor) + Nasi	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) + Nasi \\u2013 0.1kg Beras", "fields": ["Amount"]}}]	17	8
254	2026-01-13 01:36:58.700831+00	1	Ikan Bakar Gurami (Kepala) + Nasi	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) + Nasi \\u2013 0.1kg Beras", "fields": ["Amount"]}}]	17	8
255	2026-01-13 01:41:29.701719+00	3	Ikan Bakar Gurami (Badan + Nasi)	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan + Nasi) \\u2013 0.23kg Ikan Segar", "fields": ["Amount"]}}]	17	8
256	2026-01-13 01:41:55.599448+00	2	Ikan Bakar Gurami (Ekor) + Nasi	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) + Nasi \\u2013 0.23kg Ikan Segar", "fields": ["Amount"]}}]	17	8
257	2026-01-13 01:42:03.09673+00	1	Ikan Bakar Gurami (Kepala) + Nasi	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) + Nasi \\u2013 0.23kg Ikan Segar", "fields": ["Amount"]}}]	17	8
258	2026-01-13 01:42:27.996084+00	42	Ikan Bakar Gurami (Badan)	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan) \\u2013 0.23kg Ikan Segar", "fields": ["Amount"]}}, {"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan) \\u2013 0.1kg Beras", "fields": ["Amount"]}}]	17	8
259	2026-01-13 01:42:37.255693+00	41	Ikan Bakar Gurami (Ekor)	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) \\u2013 0.23kg Ikan Segar", "fields": ["Amount"]}}, {"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) \\u2013 0.1kg Beras", "fields": ["Amount"]}}]	17	8
260	2026-01-13 01:42:47.781952+00	40	Ikan Bakar Gurami (Kepala)	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) \\u2013 0.23kg Ikan Segar", "fields": ["Amount"]}}, {"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) \\u2013 0.1kg Beras", "fields": ["Amount"]}}]	17	8
261	2026-01-13 01:46:56.497828+00	3	Ikan Bakar Gurami (Badan + Nasi)	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan + Nasi) \\u2013 0.08l Kecap Manis"}}]	17	8
262	2026-01-13 01:47:33.802005+00	14	Kecap Manis	2	[{"changed": {"fields": ["Price"]}}]	6	8
263	2026-01-13 01:48:02.91881+00	2	Ikan Bakar Gurami (Ekor) + Nasi	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) + Nasi \\u2013 0.08l Kecap Manis"}}]	17	8
264	2026-01-13 01:48:23.960881+00	1	Ikan Bakar Gurami (Kepala) + Nasi	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) + Nasi \\u2013 0.08l Kecap Manis"}}]	17	8
265	2026-01-13 01:48:40.478681+00	42	Ikan Bakar Gurami (Badan)	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan) \\u2013 0.08l Kecap Manis"}}]	17	8
266	2026-01-13 01:48:53.353609+00	41	Ikan Bakar Gurami (Ekor)	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) \\u2013 0.08l Kecap Manis"}}]	17	8
267	2026-01-13 01:49:04.477588+00	40	Ikan Bakar Gurami (Kepala)	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) \\u2013 0.08l Kecap Manis"}}]	17	8
268	2026-01-13 01:55:29.825494+00	14	Kecap Manis	2	[{"changed": {"fields": ["Unit"]}}]	6	8
269	2026-01-13 01:59:07.578882+00	42	Ikan Bakar Gurami (Badan)	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan) \\u2013 7.5g Kecap Manis", "fields": ["Amount", "Unit"]}}]	17	8
270	2026-01-13 01:59:28.392+00	41	Ikan Bakar Gurami (Ekor)	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) \\u2013 7.5g Kecap Manis", "fields": ["Amount", "Unit"]}}]	17	8
271	2026-01-13 01:59:40.194912+00	40	Ikan Bakar Gurami (Kepala)	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) \\u2013 7.5g Kecap Manis", "fields": ["Amount", "Unit"]}}]	17	8
272	2026-01-13 01:59:45.38767+00	42	Ikan Bakar Gurami (Badan)	2	[]	17	8
273	2026-01-13 01:59:59.540616+00	3	Ikan Bakar Gurami (Badan + Nasi)	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan + Nasi) \\u2013 7.5g Kecap Manis", "fields": ["Amount", "Unit"]}}]	17	8
274	2026-01-13 02:00:09.927417+00	2	Ikan Bakar Gurami (Ekor) + Nasi	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) + Nasi \\u2013 7.5g Kecap Manis", "fields": ["Amount", "Unit"]}}]	17	8
275	2026-01-13 02:00:21.024754+00	1	Ikan Bakar Gurami (Kepala) + Nasi	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) + Nasi \\u2013 7.5g Kecap Manis", "fields": ["Amount", "Unit"]}}]	17	8
276	2026-01-13 02:02:24.852992+00	14	Kecap Manis	2	[{"changed": {"fields": ["Unit", "Price"]}}]	6	8
277	2026-01-13 03:01:41.18736+00	61	Sambal	2	[{"changed": {"fields": ["Unit", "Price"]}}]	6	8
278	2026-01-13 03:02:15.476766+00	3	Ikan Bakar Gurami (Badan + Nasi)	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan + Nasi) \\u2013 32g Sambal"}}]	17	8
279	2026-01-13 03:02:45.08712+00	3	Ikan Bakar Gurami (Badan + Nasi)	2	[]	17	8
280	2026-01-13 03:05:43.929872+00	49	Timun	2	[{"changed": {"fields": ["Unit", "Price"]}}]	6	8
281	2026-01-13 03:06:07.149265+00	3	Ikan Bakar Gurami (Badan + Nasi)	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan + Nasi) \\u2013 15g Timun"}}]	17	8
282	2026-01-13 03:09:25.700071+00	2	Ikan Bakar Gurami (Ekor) + Nasi	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) + Nasi \\u2013 32g Sambal"}}]	17	8
283	2026-01-13 03:09:54.06529+00	2	Ikan Bakar Gurami (Ekor) + Nasi	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) + Nasi \\u2013 15g Timun"}}]	17	8
284	2026-01-13 03:10:10.144561+00	1	Ikan Bakar Gurami (Kepala) + Nasi	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) + Nasi \\u2013 32g Sambal"}}]	17	8
285	2026-01-13 03:10:40.048636+00	1	Ikan Bakar Gurami (Kepala) + Nasi	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) + Nasi \\u2013 15g Timun"}}]	17	8
286	2026-01-17 09:18:23.386416+00	8	Sayur Urap-Urap	3		17	10
287	2026-01-17 09:18:35.985818+00	6	Sayuran	3		16	10
288	2026-01-17 14:22:03.18349+00	3	Ikan Bakar Gurami (Badan) + Nasi	2	[{"changed": {"fields": ["Name"]}}]	17	10
289	2026-01-17 14:49:24.239632+00	42	Ikan Bakar Gurami (Badan)	2	[{"deleted": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Badan) \\u2013 0.10kg Beras"}}]	17	10
290	2026-01-17 14:49:37.843449+00	41	Ikan Bakar Gurami (Ekor)	2	[{"deleted": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Ekor) \\u2013 0.10kg Beras"}}]	17	10
291	2026-01-17 14:49:58.916225+00	40	Ikan Bakar Gurami (Kepala)	2	[{"deleted": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ikan Bakar Gurami (Kepala) \\u2013 0.10kg Beras"}}]	17	10
292	2026-01-17 14:51:27.568493+00	4	Ayam Kampung Bakar	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ayam Kampung Bakar \\u2013 7.50g Kecap Manis"}}, {"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ayam Kampung Bakar \\u2013 15.00g Timun"}}]	17	10
293	2026-01-17 14:51:56.226626+00	4	Ayam Kampung Bakar	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ayam Kampung Bakar \\u2013 32.00g Sambal"}}]	17	10
294	2026-01-17 14:52:57.216942+00	43	Ayam Kampung Bakar (+ Nasi)	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ayam Kampung Bakar (+ Nasi) \\u2013 7.50g Kecap Manis"}}, {"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ayam Kampung Bakar (+ Nasi) \\u2013 15.00g Timun"}}, {"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Ayam Kampung Bakar (+ Nasi) \\u2013 32.00g Sambal"}}]	17	10
295	2026-01-17 14:56:34.252061+00	9	Extra Sambal Mangga	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Extra Sambal Mangga \\u2013 32.00g Sambal"}}]	17	10
296	2026-01-17 14:57:33.312836+00	11	Nasi Putih	2	[{"added": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Nasi Putih \\u2013 1g Beras"}}]	17	10
297	2026-01-17 14:57:52.031263+00	11	Nasi Putih	2	[{"changed": {"name": "Bahan dalam Menu (Ingredient in Dish)", "object": "Nasi Putih \\u2013 0.1g Beras", "fields": ["Amount"]}}]	17	10
298	2026-01-21 11:08:51.096293+00	49	ORD-83890	3		11	8
299	2026-01-21 11:08:51.096351+00	48	ORD-93054	3		11	8
300	2026-01-21 11:08:51.096371+00	47	ORD-37652	3		11	8
301	2026-01-21 11:08:51.096389+00	46	ORD-62532	3		11	8
302	2026-01-21 11:08:51.096405+00	45	Pesan-45	3		11	8
303	2026-01-21 11:08:51.096421+00	38	Pesan-38	3		11	8
304	2026-01-21 11:08:51.096437+00	37	Pesan-37	3		11	8
305	2026-01-21 11:10:27.982705+00	18	Cash Drawer: Dr 0.00 | Cr 1000000.00	3		38	8
306	2026-01-21 11:10:27.982816+00	17	Inventory Purchase: Dr 1000000.00 | Cr 0.00	3		38	8
307	2026-01-21 11:10:27.982843+00	16	Food Sales: Dr 0.00 | Cr 290000.00	3		38	8
308	2026-01-21 11:10:27.982864+00	15	QRIS Clearing: Dr 290000.00 | Cr 0.00	3		38	8
309	2026-01-21 11:10:27.982884+00	14	Food Sales: Dr 0.00 | Cr 7000.00	3		38	8
311	2026-01-21 11:10:27.982924+00	12	Food Sales: Dr 0.00 | Cr 72000.00	3		38	8
312	2026-01-21 11:10:27.982943+00	11	QRIS Clearing: Dr 72000.00 | Cr 0.00	3		38	8
313	2026-01-21 13:20:39.016454+00	2	Ayam	2	[{"changed": {"fields": ["Price"]}}]	6	8
314	2026-02-04 11:30:54.583426+00	8	root	2	[{"changed": {"fields": ["password"]}}]	4	10
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	inventory	ingredient
7	inventory	hygiene
8	inventory	supplies
9	inventory	inventorylocation
10	inventory	stockitem
11	orders	order
12	orders	table
13	orders	orderdish
14	orders	payment
15	orders	paymenttransaction
16	menu	category
17	menu	dish
18	menu	dishingredient
19	menu	modifiergroup
20	menu	modifier
21	menu	dishmodifiergroup
22	menu	modifieringredient
23	users	restaurant
24	users	staffmember
25	users	staffattendance
26	users	staffemployment
27	users	staffleave
28	users	staffpayroll
29	users	staffshift
30	sessions	session
31	pos	cashregister
32	pos	registersession
33	pos	registeralert
34	pos	cashtransaction
35	bank	account
36	bank	transaction
37	bank	accountgroup
38	bank	journalentry
39	inventory	restockitem
40	inventory	restockorder
41	inventory	inventorystock
42	expenses	expense
43	expenses	expensecategory
44	users	customer
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-12-24 16:21:35.147521+00
2	auth	0001_initial	2025-12-24 16:21:35.218456+00
3	admin	0001_initial	2025-12-24 16:21:35.231284+00
4	admin	0002_logentry_remove_auto_add	2025-12-24 16:21:35.234666+00
5	admin	0003_logentry_add_action_flag_choices	2025-12-24 16:21:35.238249+00
6	contenttypes	0002_remove_content_type_name	2025-12-24 16:21:35.249452+00
7	auth	0002_alter_permission_name_max_length	2025-12-24 16:21:35.258749+00
8	auth	0003_alter_user_email_max_length	2025-12-24 16:21:35.263352+00
9	auth	0004_alter_user_username_opts	2025-12-24 16:21:35.266861+00
10	auth	0005_alter_user_last_login_null	2025-12-24 16:21:35.273037+00
11	auth	0006_require_contenttypes_0002	2025-12-24 16:21:35.273937+00
12	auth	0007_alter_validators_add_error_messages	2025-12-24 16:21:35.27703+00
13	auth	0008_alter_user_username_max_length	2025-12-24 16:21:35.283351+00
14	auth	0009_alter_user_last_name_max_length	2025-12-24 16:21:35.287111+00
15	auth	0010_alter_group_name_max_length	2025-12-24 16:21:35.291496+00
16	auth	0011_update_proxy_permissions	2025-12-24 16:21:35.295003+00
17	auth	0012_alter_user_first_name_max_length	2025-12-24 16:21:35.298495+00
18	users	0001_initial	2025-12-24 16:21:35.327753+00
19	users	0002_staffmember_date_of_birth_staffmember_phone_and_more	2025-12-24 16:21:35.428664+00
60	inventory	0001_initial	2025-12-25 13:42:53.034018+00
61	menu	0001_initial	2025-12-25 13:42:53.03546+00
62	orders	0001_initial	2025-12-25 13:42:53.036009+00
63	inventory	0002_beverage_side	2025-12-25 13:42:53.036804+00
64	menu	0002_remove_menuitem_category_dish_dishingredient_and_more	2025-12-25 13:42:53.037276+00
65	orders	0002_remove_orderitem_menu_item_remove_orderitem_order_and_more	2025-12-25 13:42:53.037697+00
66	orders	0003_alter_order_options_alter_orderbeverage_options_and_more	2025-12-25 13:42:53.038014+00
67	orders	0004_order_payment_method	2025-12-25 13:42:53.038394+00
68	orders	0005_alter_order_created_at	2025-12-25 13:42:53.038779+00
69	orders	0006_order_created_by	2025-12-25 13:42:53.039128+00
70	orders	0007_alter_order_status	2025-12-25 13:42:53.039504+00
71	orders	0008_alter_order_options_alter_orderbeverage_options_and_more	2025-12-25 13:42:53.039819+00
72	orders	0009_payment_paymenttransaction	2025-12-25 13:42:53.040158+00
73	orders	0010_delete_orderbeverage	2025-12-25 13:42:53.040468+00
74	menu	0003_delete_menuitem	2025-12-25 13:42:53.040826+00
75	menu	0004_alter_category_options_alter_dish_options_and_more	2025-12-25 13:42:53.041118+00
76	menu	0005_alter_category_options_alter_dish_options_and_more	2025-12-25 13:42:53.041514+00
77	menu	0006_dishingredient_unit_alter_dishingredient_amount	2025-12-25 13:42:53.044036+00
78	inventory	0003_delete_drinkitem_delete_snackitem_and_more	2025-12-25 13:42:53.045879+00
79	inventory	0004_alter_beverage_options_alter_ingredient_options_and_more	2025-12-25 13:42:53.04653+00
80	inventory	0005_alter_beverage_options_alter_ingredient_options_and_more	2025-12-25 13:42:53.047731+00
81	inventory	0006_finance_hygiene_supplies_utility	2025-12-25 13:42:53.048741+00
82	inventory	0007_remove_finance_utility	2025-12-25 13:42:53.049243+00
83	inventory	0008_hygiene_price_ingredient_price_supplies_price	2025-12-25 13:42:53.049854+00
84	inventory	0009_unit_beverage_stock_unit_and_more	2025-12-25 13:42:53.050412+00
85	inventory	0010_remove_ingredient_stock_unit_and_more	2025-12-25 13:42:53.050883+00
86	menu	0007_migrate_beverages_to_dishes	2025-12-25 13:42:53.051488+00
87	inventory	0011_delete_beverage	2025-12-25 13:42:53.051934+00
88	menu	0008_modifiergroup_modifier_dishmodifiergroup_and_more	2025-12-25 13:42:53.052435+00
89	orders	0011_orderitemmodifier	2025-12-25 13:42:53.053262+00
90	orders	0012_remove_orderside_order_remove_orderside_side_and_more	2025-12-25 13:42:53.053721+00
91	inventory	0012_delete_side_remove_stockmovement_created_by_and_more	2025-12-25 13:42:53.054156+00
92	inventory	0013_alter_stockitem_unique_together_hygiene_restaurant_and_more	2025-12-25 13:42:53.054637+00
93	inventory	0014_remove_hygiene_stock_unit_and_more	2025-12-25 13:42:53.055484+00
94	inventory	0015_add_flat_stockitem_fields	2025-12-25 13:42:53.056199+00
95	inventory	0016_backfill_stockitem_name_and_make_nonnull	2025-12-25 13:42:53.056869+00
96	inventory	0017_remove_stockitem_content_type_object_id	2025-12-25 13:42:53.057488+00
97	inventory	0018_alter_stockitem_defaults	2025-12-25 13:42:53.058269+00
98	inventory	0019_alter_stockitem_unique_together_alter_stockitem_unit_and_more	2025-12-25 13:42:53.058823+00
99	inventory	0020_alter_stockitem_unique_together	2025-12-25 13:42:53.05968+00
100	menu	0009_alter_modifier_unique_together_remove_modifier_group_and_more	2025-12-25 13:43:24.435705+00
101	menu	0010_alter_dish_options	2025-12-25 13:43:24.441295+00
102	orders	0013_alter_table_options_alter_order_status	2025-12-25 13:43:24.446598+00
103	orders	0014_order_printed	2025-12-25 13:43:24.451794+00
104	orders	0015_alter_orderdish_order	2025-12-25 13:43:24.460875+00
105	pos	0001_initial	2025-12-25 13:43:24.530904+00
106	sessions	0001_initial	2025-12-25 13:43:24.53678+00
107	bank	0001_initial	2025-12-30 03:44:50.142409+00
108	orders	0016_alter_order_order_number	2025-12-30 10:16:55.712235+00
109	bank	0002_accountgroup_alter_account_options_and_more	2026-01-04 14:19:20.562015+00
110	inventory	0021_restockorder_restockitem	2026-01-07 10:22:42.03412+00
111	inventory	0022_remove_hygiene_max_stock_remove_hygiene_restaurant_and_more	2026-01-07 11:04:58.532576+00
112	orders	0017_order_restaurant_table_restaurant	2026-01-07 11:04:58.566009+00
113	expenses	0001_initial	2026-01-21 10:53:45.508987+00
114	users	0003_alter_staffmember_role	2026-01-21 12:46:43.724547+00
115	users	0004_customer	2026-01-27 14:55:59.372378+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
lbvyfdk9bsvhr0hw1p1jvarexmxu8yg0	.eJxVjDsOwjAQBe_iGln-LjElPWewvN41DiBHipMKcXcSKQW0b2beW8S0LjWunec4krgILU6_G6b85LYDeqR2n2Se2jKPKHdFHrTL20T8uh7u30FNvW518gb9YEPQpqjBFU1Fgw3kkc_FKCC2jkAro5gJHDJl4yFntBa2LovPF9YDN84:1vdm3D:mnW86P91oo4jdxYnhZuE7hr0aQNOVQlm7phYE5eqJSw	2026-01-22 09:11:27.547279+00
pre4mx3llwuq4x5sahsbxs2hc94azn5w	.eJxVjDsOwjAQBe_iGln-LjElPWewvN41DiBHipMKcXcSKQW0b2beW8S0LjWunec4krgILU6_G6b85LYDeqR2n2Se2jKPKHdFHrTL20T8uh7u30FNvW518gb9YEPQpqjBFU1Fgw3kkc_FKCC2jkAro5gJHDJl4yFntBa2LovPF9YDN84:1vdnOm:5YJMF5OSKsSlIA2Yzt4zoQ0O7_XgeWerLQCl7_773BU	2026-01-22 10:37:48.564682+00
rkcngwqbpv3du8ht4lexdkbt4254lb4j	.eJxVjEEOwiAQRe_C2hCs04G6dN8zkBkYpGogKe3KeHfbpAvd_vfefytP65L92mT2U1RX5dTpd2MKTyk7iA8q96pDLcs8sd4VfdCmxxrldTvcv4NMLW81gxNniM0QLDMQWgyu77qESQLhxRES2J6I0cCAaBmFNzGeQ4oATn2-_Io4nA:1veVIV:-uFDSI05uQJdz2Rr4BHVI_B8HZBx-sRq79E-bVPKy2c	2026-01-24 09:30:15.385562+00
88tkgsco2jol0t7u90yewn3lrp6jr15v	.eJxVjEEOwiAQRe_C2hCs04G6dN8zkBkYpGogKe3KeHfbpAvd_vfefytP65L92mT2U1RX5dTpd2MKTyk7iA8q96pDLcs8sd4VfdCmxxrldTvcv4NMLW81gxNniM0QLDMQWgyu77qESQLhxRES2J6I0cCAaBmFNzGeQ4oATn2-_Io4nA:1vewQm:0pFY0xZ3MixnU9-Z3zo5MUIckSiPtwssAwtfs9ufA5k	2026-01-25 14:28:36.12909+00
1jiutuom8cakxfb575j8sgspzoguhqg6	.eJxVjEEOwiAQRe_C2hCs04G6dN8zkBkYpGogKe3KeHfbpAvd_vfefytP65L92mT2U1RX5dTpd2MKTyk7iA8q96pDLcs8sd4VfdCmxxrldTvcv4NMLW81gxNniM0QLDMQWgyu77qESQLhxRES2J6I0cCAaBmFNzGeQ4oATn2-_Io4nA:1vfGAC:RqDjgE_EbAbJ9YPYH9TqLtOBl7-4_RI6iKK9tdEfw7c	2026-01-26 11:32:48.780299+00
cok9j4qkv6z3xkuqjlr2w0emztk2hlng	.eJxVjEEOwiAQRe_C2hCggODSfc9ABmZGqoYmpV0Z765NutDtf-_9l0iwrTVtnZY0obgIrcTpd8xQHtR2gndot1mWua3LlOWuyIN2Oc5Iz-vh_h1U6PVbe2cGHxQ7621kZspnx9oqVCVgjhTVYDCDsY5D8QyxUNQaPSoMkJHE-wMDwjjQ:1vh1hp:h65ca8LjWGIbCieYVKFuIyqsMzmAQvvjDtFH0ZCykUY	2026-01-31 08:30:49.888419+00
lwuv8bh6ge1lb4zbihvif5f7nmebtp8u	.eJxVjEEOwiAQRe_C2hCs04G6dN8zkBkYpGogKe3KeHfbpAvd_vfefytP65L92mT2U1RX5dTpd2MKTyk7iA8q96pDLcs8sd4VfdCmxxrldTvcv4NMLW81gxNniM0QLDMQWgyu77qESQLhxRES2J6I0cCAaBmFNzGeQ4oATn2-_Io4nA:1vhPSc:bBDbWlCbBge48jgdSR4qwQdvWtqGSlCBV5lvokG7NQU	2026-02-01 09:52:42.256434+00
d4u2dwk3ubysghmx7rltz7tzzb6g23py	.eJxVjEEOwiAQRe_C2hCggODSfc9ABmZGqoYmpV0Z765NutDtf-_9l0iwrTVtnZY0obgIrcTpd8xQHtR2gndot1mWua3LlOWuyIN2Oc5Iz-vh_h1U6PVbe2cGHxQ7621kZspnx9oqVCVgjhTVYDCDsY5D8QyxUNQaPSoMkJHE-wMDwjjQ:1vnb5y:bn70pTUj_SXlm8Pfhyt9VnNuqHCf3iB587-60Z9DGjs	2026-02-18 11:30:54.592603+00
hboqqt6qptqqup3dlgwreh4m5c3y8dmn	.eJxVjEEOwiAQRe_C2hCggODSfc9ABmZGqoYmpV0Z765NutDtf-_9l0iwrTVtnZY0obgIrcTpd8xQHtR2gndot1mWua3LlOWuyIN2Oc5Iz-vh_h1U6PVbe2cGHxQ7621kZspnx9oqVCVgjhTVYDCDsY5D8QyxUNQaPSoMkJHE-wMDwjjQ:1vsf7L:xsJ9JS0YqfLIEfBvsFhSa5xOq3uvR-bL5Et8ZukhAP8	2026-03-04 10:49:15.027321+00
\.


--
-- Data for Name: expenses_expense; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.expenses_expense (id, amount, date, description, is_payroll, created_at, payment_account_id, restaurant_id, transaction_id, category_id) FROM stdin;
1	1000000.00	2026-01-21		f	2026-01-21 11:03:49.867163+00	6	1	13	6
2	134280.00	2026-01-21	Restock #18: Beras x9.00	f	2026-01-21 13:17:30.396082+00	6	1	15	6
3	261000.00	2026-01-21	Restock #19: Sendok Putih x22.00, Ayam x5.00	f	2026-01-21 13:21:06.303841+00	6	1	16	6
4	1600000.00	2026-01-21	Salary for Auntie (2026-01-01 to 2026-01-21)	t	2026-01-21 13:22:29.140263+00	8	1	17	1
5	1600000.00	2026-02-04	Salary for Auntie (2026-02-01 to 2026-02-04)	t	2026-02-04 11:38:09.099299+00	8	1	18	1
6	400000.00	2026-02-04		f	2026-02-04 11:52:53.082657+00	7	1	19	7
\.


--
-- Data for Name: expenses_expensecategory; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.expenses_expensecategory (id, name, account_id, restaurant_id) FROM stdin;
1	Staff Salary	12	1
2	Rent	13	1
3	Electricity	14	1
4	Maintenance	15	1
5	Marketing	16	1
6	Inventory Purchase	10	1
7	Tax	17	1
\.


--
-- Data for Name: inventory_hygiene; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.inventory_hygiene (id, name, unit, image, price) FROM stdin;
\.


--
-- Data for Name: inventory_ingredient; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.inventory_ingredient (id, name, unit, image, price) FROM stdin;
8	Blue Band	kg		0.00
9	Mentega	kg		0.00
13	Garam	kg		0.00
15	Terasi	kg		0.00
16	Micin	kg		0.00
21	Kencur	kg		0.00
22	Kemiri	kg		0.00
23	Kunyit	kg		0.00
24	Jahe	kg		0.00
25	Lengkuas	kg		0.00
26	Serai	kg		0.00
27	Daun Jeruk	kg		0.00
28	Daun Salam	kg		0.00
29	Vanili Bubuk	kg		0.00
31	Kopi	kg		0.00
32	Teh	kg		0.00
33	Mangga Segar	kg		0.00
34	Pencit	kg		0.00
35	Pisang	kg		0.00
36	Jeruk	kg		0.00
37	Terong	kg		0.00
38	Kangkung	kg		0.00
39	Bayam	kg		0.00
40	Sayur Campur	kg		0.00
41	Kemangi	kg		0.00
42	Cambah (Tauge)	kg		0.00
43	Kacang Panjang	kg		0.00
44	Kelapa Parut	kg		0.00
45	Kelapa	kg		0.00
46	Jagung Biasa	kg		0.00
47	Jagung Manis	kg		0.00
48	Godong Brambang (Daun Bawang)	kg		0.00
50	Tomat	kg		0.00
51	Lombok Besar	kg		0.00
52	Cabai Merah	kg		0.00
53	Cabai Rawit	kg		0.00
54	Santan Kelapa	liter		0.00
56	Tahu	kg		0.00
57	Tempe	kg		0.00
58	Cao (Cincau/Grass Jelly)	kg		0.00
59	Nata De Coo	kg		0.00
11	Gula Merah	kg	inventory_images/gula_merah.png	0.00
10	Gula	kg	inventory_images/gula.png	17000.00
6	Minyak (RF Fortune)	liter	inventory_images/minyak_geng_wit.jpeg	232000.00
17	Saori Tiram	liter	inventory_images/saus_tirma.png	71429.00
60	Nastar	kg	inventory_images/_Nastar.png	0.00
1	Ikan Segar	kg	inventory_images/ikan_segar.png	48000.00
14	Kecap Manis	g		44.00
61	Sambal	g	inventory_images/sambal.png	16.56
49	Timun	g		15.00
2	Ayam	kg	inventory_images/ayam.png	50000.00
3	Telur	kg	inventory_images/telur.png	1000.00
5	Arang Kayu	kg	inventory_images/_temp.png	0.00
7	Minyak Kelapa	liter	inventory_images/minyak_kelapa.png	0.00
55	Asam Jawa	kg	inventory_images/asam-jawa.png	0.00
20	Bawang Goreng	kg	inventory_images/bawang_goreng.png	0.00
18	Bawang Merah	kg	inventory_images/bawang-merah.png	0.00
19	Bawang Putih	kg	inventory_images/bawang_putih.png	0.00
4	Beras	kg	inventory_images/beras.png	14920.00
30	Tepung Terigu	kg	inventory_images/tepung_terigu_bag.png	11000.00
12	Gula Aren	kg	inventory_images/gula_aren.png	0.00
\.


--
-- Data for Name: inventory_inventorylocation; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.inventory_inventorylocation (id, name, is_default, restaurant_id) FROM stdin;
\.


--
-- Data for Name: inventory_inventorystock; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.inventory_inventorystock (id, stock, max_stock, low_stock_threshold, hygiene_id, ingredient_id, restaurant_id, supplies_id) FROM stdin;
3	35.00	100.00	10.00	\N	6	1	\N
4	22.00	100.00	10.00	\N	7	1	\N
5	10.00	100.00	10.00	\N	8	1	\N
6	31.00	100.00	10.00	\N	9	1	\N
7	41.00	100.00	10.00	\N	10	1	\N
8	34.00	100.00	10.00	\N	11	1	\N
9	5.00	100.00	10.00	\N	12	1	\N
10	20.00	100.00	10.00	\N	13	1	\N
12	35.00	100.00	10.00	\N	15	1	\N
13	42.00	100.00	10.00	\N	16	1	\N
14	48.00	100.00	10.00	\N	17	1	\N
15	43.00	100.00	10.00	\N	18	1	\N
16	39.00	100.00	10.00	\N	19	1	\N
17	27.00	100.00	10.00	\N	20	1	\N
18	22.00	100.00	10.00	\N	21	1	\N
19	12.00	100.00	10.00	\N	22	1	\N
20	30.00	100.00	10.00	\N	23	1	\N
21	39.00	100.00	10.00	\N	24	1	\N
22	42.00	100.00	10.00	\N	25	1	\N
23	40.00	100.00	10.00	\N	26	1	\N
24	49.00	100.00	10.00	\N	27	1	\N
25	30.00	100.00	10.00	\N	28	1	\N
26	13.00	100.00	10.00	\N	29	1	\N
27	26.00	100.00	10.00	\N	30	1	\N
28	5.00	100.00	10.00	\N	31	1	\N
29	18.00	100.00	10.00	\N	32	1	\N
30	23.00	100.00	10.00	\N	33	1	\N
31	46.00	100.00	10.00	\N	34	1	\N
32	9.00	100.00	10.00	\N	35	1	\N
33	49.00	100.00	10.00	\N	36	1	\N
34	33.00	100.00	10.00	\N	37	1	\N
35	39.00	100.00	10.00	\N	38	1	\N
36	49.00	100.00	10.00	\N	39	1	\N
37	36.00	100.00	10.00	\N	40	1	\N
38	12.00	100.00	10.00	\N	41	1	\N
39	8.00	100.00	10.00	\N	42	1	\N
40	34.00	100.00	10.00	\N	43	1	\N
41	27.00	100.00	10.00	\N	44	1	\N
42	24.00	100.00	10.00	\N	45	1	\N
43	25.00	100.00	10.00	\N	46	1	\N
44	28.00	100.00	10.00	\N	47	1	\N
45	5.00	100.00	10.00	\N	48	1	\N
47	50.00	100.00	10.00	\N	50	1	\N
48	47.00	100.00	10.00	\N	51	1	\N
49	36.00	100.00	10.00	\N	52	1	\N
50	33.00	100.00	10.00	\N	53	1	\N
51	7.00	100.00	10.00	\N	54	1	\N
53	34.00	100.00	10.00	\N	56	1	\N
54	24.00	100.00	10.00	\N	57	1	\N
55	42.00	100.00	10.00	\N	58	1	\N
56	31.00	100.00	10.00	\N	59	1	\N
57	40.00	100.00	10.00	\N	60	1	\N
60	47.00	100.00	10.00	\N	3	1	\N
63	15.00	100.00	10.00	\N	5	2	\N
64	46.00	100.00	10.00	\N	6	2	\N
65	46.00	100.00	10.00	\N	7	2	\N
66	47.00	100.00	10.00	\N	8	2	\N
67	19.00	100.00	10.00	\N	9	2	\N
68	36.00	100.00	10.00	\N	10	2	\N
69	36.00	100.00	10.00	\N	11	2	\N
70	8.00	100.00	10.00	\N	12	2	\N
71	16.00	100.00	10.00	\N	13	2	\N
72	46.00	100.00	10.00	\N	14	2	\N
73	14.00	100.00	10.00	\N	15	2	\N
74	6.00	100.00	10.00	\N	16	2	\N
75	50.00	100.00	10.00	\N	17	2	\N
76	40.00	100.00	10.00	\N	18	2	\N
77	49.00	100.00	10.00	\N	19	2	\N
78	40.00	100.00	10.00	\N	20	2	\N
79	41.00	100.00	10.00	\N	21	2	\N
80	17.00	100.00	10.00	\N	22	2	\N
81	22.00	100.00	10.00	\N	23	2	\N
82	37.00	100.00	10.00	\N	24	2	\N
83	20.00	100.00	10.00	\N	25	2	\N
84	38.00	100.00	10.00	\N	26	2	\N
85	46.00	100.00	10.00	\N	27	2	\N
86	30.00	100.00	10.00	\N	28	2	\N
87	21.00	100.00	10.00	\N	29	2	\N
88	37.00	100.00	10.00	\N	30	2	\N
89	44.00	100.00	10.00	\N	31	2	\N
90	43.00	100.00	10.00	\N	32	2	\N
91	37.00	100.00	10.00	\N	33	2	\N
92	29.00	100.00	10.00	\N	34	2	\N
93	20.00	100.00	10.00	\N	35	2	\N
94	50.00	100.00	10.00	\N	36	2	\N
95	42.00	100.00	10.00	\N	37	2	\N
96	32.00	100.00	10.00	\N	38	2	\N
97	46.00	100.00	10.00	\N	39	2	\N
98	27.00	100.00	10.00	\N	40	2	\N
99	10.00	100.00	10.00	\N	41	2	\N
100	16.00	100.00	10.00	\N	42	2	\N
101	29.00	100.00	10.00	\N	43	2	\N
102	16.00	100.00	10.00	\N	44	2	\N
103	10.00	100.00	10.00	\N	45	2	\N
104	7.00	100.00	10.00	\N	46	2	\N
105	26.00	100.00	10.00	\N	47	2	\N
106	43.00	100.00	10.00	\N	48	2	\N
107	16.00	100.00	10.00	\N	49	2	\N
108	47.00	100.00	10.00	\N	50	2	\N
109	35.00	100.00	10.00	\N	51	2	\N
110	29.00	100.00	10.00	\N	52	2	\N
111	5.00	100.00	10.00	\N	53	2	\N
112	5.00	100.00	10.00	\N	54	2	\N
113	43.00	100.00	10.00	\N	55	2	\N
114	45.00	100.00	10.00	\N	56	2	\N
115	50.00	100.00	10.00	\N	57	2	\N
116	30.00	100.00	10.00	\N	58	2	\N
117	43.00	100.00	10.00	\N	59	2	\N
118	13.00	100.00	10.00	\N	60	2	\N
119	14.00	100.00	10.00	\N	61	2	\N
120	30.00	100.00	10.00	\N	2	2	\N
59	75.25	100.00	10.00	\N	2	1	\N
1	89.50	100.00	10.00	\N	4	1	\N
11	0.00	100.00	10.00	\N	14	1	\N
46	0.00	100.00	10.00	\N	49	1	\N
58	0.00	100.00	10.00	\N	61	1	\N
52	80.00	100.00	10.00	\N	55	1	\N
121	47.00	100.00	10.00	\N	3	2	\N
122	24.00	100.00	10.00	\N	1	2	\N
124	49.00	100.00	10.00	\N	\N	2	12
62	50.00	100.00	10.00	\N	4	2	\N
2	122.00	100.00	10.00	\N	5	1	\N
61	43.07	100.00	10.00	\N	1	1	\N
123	59.00	100.00	10.00	\N	\N	1	12
\.


--
-- Data for Name: inventory_restockitem; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.inventory_restockitem (id, item_type, item_id, quantity_needed, quantity_purchased, restock_order_id) FROM stdin;
27	ingredient	4	1.00	9.00	12
29	ingredient	5	1.00	12.00	13
30	ingredient	5	1.00	22.00	14
33	ingredient	5	1.00	62.00	15
35	ingredient	2	1.00	45.00	15
34	ingredient	55	1.00	21.00	15
36	ingredient	4	1.00	20.00	17
37	ingredient	4	1.00	9.00	18
38	stock	12	1.00	22.00	19
39	ingredient	2	1.00	5.00	19
40	ingredient	55	1.00	12.00	20
\.


--
-- Data for Name: inventory_restockorder; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.inventory_restockorder (id, status, created_at, updated_at, restaurant_id) FROM stdin;
12	completed	2026-01-07 16:26:27.715489+00	2026-01-07 22:53:42.628282+00	1
13	completed	2026-01-07 22:53:42.646347+00	2026-01-07 23:08:25.026818+00	1
14	completed	2026-01-07 23:08:25.043536+00	2026-01-07 23:08:40.461414+00	1
16	pending	2026-01-07 23:09:03.97464+00	2026-01-07 23:09:03.974648+00	2
15	completed	2026-01-07 23:08:40.477514+00	2026-01-21 10:44:01.19647+00	1
17	completed	2026-01-21 10:44:01.218164+00	2026-01-21 13:02:21.536796+00	1
18	completed	2026-01-21 13:02:21.561287+00	2026-01-21 13:17:30.40377+00	1
19	completed	2026-01-21 13:17:30.429784+00	2026-01-21 13:21:06.310946+00	1
20	completed	2026-01-21 13:21:06.331253+00	2026-02-04 11:55:20.778908+00	1
21	pending	2026-02-04 11:55:20.802541+00	2026-02-04 11:55:20.802552+00	1
\.


--
-- Data for Name: inventory_stockitem; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.inventory_stockitem (id, unit, restaurant_id, name, stock, max_stock, price, image) FROM stdin;
\.


--
-- Data for Name: inventory_supplies; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.inventory_supplies (id, name, unit, image, price) FROM stdin;
12	Sendok Putih	pcs		500.00
\.


--
-- Data for Name: menu_category; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.menu_category (id, name) FROM stdin;
1	Minuman
2	Menu Utama
5	Lainnya
4	Snack
\.


--
-- Data for Name: menu_dish; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.menu_dish (id, name, price, description, is_available, image, category_id) FROM stdin;
22	Teh Manis (Es/Panas)	7000.00	Teh melati wangi dengan gula asli dan es batu.	t	menu_items/es_teh_manis.png	1
27	Es Beras Kencur Jumbo	15000.00		t	menu_items/es_teh_manis_kVblBJq.png	1
28	Beras Kencur (Botol kecil)	13000.00		t		1
29	Beras Kencur (Botol 1,5L)	50000.00		t		1
30	Es Cao Susu	13000.00		t		1
31	Es Cao	10000.00		t		1
4	Ayam Kampung Bakar	30000.00	Ayam kampung panggang bumbu tradisional	t	menu_items/ayam_kampung_bakar.png	2
43	Ayam Kampung Bakar (+ Nasi)	31000.00		t	menu_items/ayam_kampung_bakar_5JrUkQ3.png	2
32	Teh Tawar (Es/Panas)	6000.00		t		1
33	Teh Manis (Jumbo)	10000.00		t		1
34	Teh Tawar (Jumbo)	10000.00		t		1
17	Dadar Jagung	5000.00	Perkedel jagung renyah	t	menu_items/dadar_jagung.png	5
21	Es Jeruk Manis	13000.00	Perasan jeruk manis segar disajikan dingin.	t	menu_items/es_jeruk_manis.png	1
9	Extra Sambal Mangga	5000.00	Extra sambal	t	menu_items/sambal.png	5
16	Kacang Goreng	3000.00	Kacang tanah goreng	t	menu_items/kacang_goreng.png	4
35	Es Jeruk Manis (Jumbo)	18000.00		t		1
11	Nasi Putih	6000.00	Nasi putih pulen	t	menu_items/nasi_putih.png	5
12	Kerupuk Udang	7000.00	Kerupuk dengan rasa udang	t	menu_items/kerupuk_udang.png	4
36	Teh Botol Sosro	7000.00		t	menu_items/tehbotle.png	1
46	Paket Kotak Ikan Gurami Bakar (Kepala)	35000.00		t		2
44	Paket Kotak Ikan Gurami Bakar (Ekor)	35000.00	Ikan gurami bakar, serta disajikan dengan nasi putih, sambal mangga dan urap-urap, yang dikemas dengan kemasan kotak	t		2
47	Paket Kotak Ikan Gurami Bakar (Ekor)	35000.00		t		2
15	Kerupuk Puli	7000.00	Kerupuk dari beras ketan	t	menu_items/kerupuk_puli.png	4
14	Kerupuk Putih	7000.00	Kerupuk putih renyah	t	menu_items/kerupuk_putih.png	4
13	Kerupuk Rambak	7000.00	Kerupuk kulit sapi goreng	t	menu_items/kerupuk_rambak.png	4
37	Teh Pucuk Harum	7000.00		t		1
18	Air mineral	6000.00		t	menu_items/air_mineral.png	1
48	Melinjo Manis	3000.00		t		4
25	Es Beras Kencur	10000.00		t		1
26	Es Beras Kencur (Tampa Es)	12000.00		t	menu_items/es_teh_manis_eZp4wVU.png	1
38	Air Panas	5000.00		t		1
39	Es Batu	1000.00		t		1
49	Kerupuk Blek	1000.00		t		4
50	Usus Ayam	5000.00		t		4
51	Tahu Telur	13000.00		t		5
2	Ikan Bakar Gurami (Ekor) + Nasi	32000.00	Bagian ekor gurami bakar	t	menu_items/ikan_bakar_gurami_ekor.png	2
45	Paket Kotak Ayam Bakar	34000.00	Ayam bakar (Dada/Paha) dengan bumbu\r\nmerah Khas Banjarmasin, serta disajikan dengan nasi putih, sambal mangga dan urap-urap, yang dikemas dengan kemasan kotak	t		2
10	Pisang Goreng	6000.00	Pisang goreng renyah	t	menu_items/pisang_goreng.png	4
52	Extra Lalapan	5000.00		t		5
1	Ikan Bakar Gurami (Kepala) + Nasi	32000.00	Bagian kepala gurami bakar	t	menu_items/ikan_bakar_gurami_kepala.png	2
3	Ikan Bakar Gurami (Badan) + Nasi	32000.00	Bagian badan gurami bakar + nasi	t	menu_items/ikan_bakar_gurami_badan.png	2
42	Ikan Bakar Gurami (Badan)	31000.00		t	menu_items/ikan_bakar_gurami_badan_MGQQ27T.png	2
41	Ikan Bakar Gurami (Ekor)	31000.00		t	menu_items/ikan_bakar_gurami_ekor_JE0N47l.png	2
40	Ikan Bakar Gurami (Kepala)	31000.00		t	menu_items/ikan_bakar_gurami_kepala_tZIxQsV.png	2
\.


--
-- Data for Name: menu_dishingredient; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.menu_dishingredient (id, amount, dish_id, ingredient_id, unit) FROM stdin;
7	0.25	4	2	kg
17	0.25	43	2	kg
18	0.10	43	4	kg
8	0.10	3	4	kg
9	0.10	2	4	kg
10	0.10	1	4	kg
1	0.23	3	1	kg
3	0.23	2	1	kg
5	0.23	1	1	kg
15	0.23	42	1	kg
13	0.23	41	1	kg
11	0.23	40	1	kg
22	7.50	42	14	g
23	7.50	41	14	g
24	7.50	40	14	g
19	7.50	3	14	g
20	7.50	2	14	g
21	7.50	1	14	g
25	32.00	3	61	g
26	15.00	3	49	g
27	32.00	2	61	g
28	15.00	2	49	g
29	32.00	1	61	g
30	15.00	1	49	g
31	32.00	42	61	g
32	15.00	42	49	g
33	0.10	46	4	kg
34	0.23	46	1	kg
35	7.50	46	14	g
36	32.00	46	61	g
37	15.00	46	49	g
38	0.10	44	4	kg
39	0.23	44	1	kg
40	7.50	44	14	g
41	32.00	44	61	g
42	15.00	44	49	g
43	0.10	47	4	kg
44	0.23	47	1	kg
45	7.50	47	14	g
46	32.00	47	61	g
47	15.00	47	49	g
48	32.00	41	61	g
49	15.00	41	49	g
50	32.00	40	61	g
51	15.00	40	49	g
52	7.50	4	14	g
53	15.00	4	49	g
54	32.00	4	61	g
55	7.50	43	14	g
56	15.00	43	49	g
57	32.00	43	61	g
58	32.00	9	61	g
59	0.10	11	4	g
\.


--
-- Data for Name: orders_order; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.orders_order (id, order_number, status, total_price, created_at, table_id, payment_method, created_by_id, printed, restaurant_id) FROM stdin;
50	Pesan-50	paid	94000.00	2026-01-21 12:27:06.958915+00	6	cash	8	f	1
\.


--
-- Data for Name: orders_orderdish; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.orders_orderdish (id, quantity, price_per_unit, dish_id, order_id) FROM stdin;
175	1	30000.00	4	50
176	1	5000.00	9	50
177	1	6000.00	11	50
178	1	7000.00	12	50
179	1	7000.00	13	50
180	1	7000.00	15	50
181	1	32000.00	2	50
\.


--
-- Data for Name: orders_payment; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.orders_payment (id, method, amount, received_cash, change, created_at, order_id) FROM stdin;
\.


--
-- Data for Name: orders_paymenttransaction; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.orders_paymenttransaction (id, provider, reference, status, raw_response, created_at, payment_id) FROM stdin;
\.


--
-- Data for Name: orders_table; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.orders_table (id, name, restaurant_id) FROM stdin;
1	Meja 1	\N
2	Meja 2	\N
3	Meja 3	\N
4	Meja 4	\N
5	Takeaway	\N
6	Meja 1	1
7	Meja 2	1
8	Meja 3	1
9	Meja 4	1
10	Meja 5	1
11	Meja 1	2
12	Meja 2	2
13	Meja 3	2
14	Meja 4	2
15	Meja 5	2
16	T1	1
17	T2	1
18	T3	1
19	T4	1
20	T5	1
\.


--
-- Data for Name: pos_cashregister; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.pos_cashregister (id, name, location, is_active, created_at, restaurant_id) FROM stdin;
\.


--
-- Data for Name: pos_cashtransaction; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.pos_cashtransaction (id, transaction_type, amount, description, created_at, created_by_id, reference_order_id, session_id) FROM stdin;
\.


--
-- Data for Name: pos_registeralert; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.pos_registeralert (id, alert_type, severity, message, is_acknowledged, acknowledged_at, created_at, acknowledged_by_id, register_id, session_id) FROM stdin;
\.


--
-- Data for Name: pos_registersession; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.pos_registersession (id, started_at, ended_at, opening_cash_amount, closing_cash_amount, expected_cash_amount, cash_variance, opening_notes, closing_notes, register_id, staff_member_id) FROM stdin;
\.


--
-- Data for Name: users_customer; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.users_customer (id, phone, points_balance, tier, avatar, created_at, user_id) FROM stdin;
1	628123456789	1250	Gold		2026-01-27 15:19:42.48283+00	11
\.


--
-- Data for Name: users_restaurant; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.users_restaurant (id, name, code, address, active, created_at) FROM stdin;
1	Restaurant 1	kalianak_1		t	2025-12-28 13:27:47.579112+00
2	Restaurant 2	kalianak_2		t	2025-12-28 13:28:06.79392+00
\.


--
-- Data for Name: users_staffattendance; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.users_staffattendance (id, date, status, reason, notes, created_at, restaurant_id, staff_id) FROM stdin;
\.


--
-- Data for Name: users_staffemployment; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.users_staffemployment (id, employment_type, salary_amount, hourly_rate, currency, start_date, end_date, is_current, notes, created_at, restaurant_id, staff_id) FROM stdin;
1	salaried	1600000.00	0.00	IDR	2026-01-21	\N	t		2026-01-21 13:00:47.863062+00	1	3
\.


--
-- Data for Name: users_staffleave; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.users_staffleave (id, leave_type, start_date, end_date, status, reason, notes, created_at, approved_by_id, restaurant_id, staff_id) FROM stdin;
\.


--
-- Data for Name: users_staffmember; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.users_staffmember (id, role, image, active, created_at, restaurant_id, user_id, date_of_birth, phone) FROM stdin;
1	admin	staff_images/user_avatar_1.jpg	t	2026-01-10 02:10:38.538428+00	1	1	\N	
4	staff	staff_images/user-f.jpg	t	2026-01-10 09:36:27.458799+00	1	6	\N	
5	admin	staff_images/mamma.jpg	t	2026-01-10 09:37:05.183276+00	1	7	\N	
6	staff	staff_images/_personal_vulan.jpeg	t	2026-01-10 09:37:47.738009+00	1	4	\N	
2	staff	staff_images/_personal_lis.jpeg	t	2026-01-10 02:18:12.186724+00	1	2	\N	
7	staff	staff_images/_personal_mie.jpeg	t	2026-01-10 09:38:49.963829+00	1	3	\N	
8	admin	staff_images/_personal_bror.jpeg	t	2026-01-10 09:39:56.512225+00	1	9	\N	
3	staff	staff_images/_personal_antie.jpeg	t	2026-01-10 09:26:53.192912+00	1	5	\N	
\.


--
-- Data for Name: users_staffpayroll; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.users_staffpayroll (id, period_start, period_end, total_hours, gross_amount, net_amount, status, processed_at, notes, created_at, restaurant_id, staff_id) FROM stdin;
1	2026-01-01	2026-01-21	0.00	1600000.00	1600000.00	paid	2026-01-21 13:22:29.133103+00	Payroll for 2026-01-01 to 2026-01-21	2026-01-21 13:22:29.133754+00	1	3
2	2026-02-01	2026-02-04	0.00	1600000.00	1600000.00	paid	2026-02-04 11:38:09.089498+00	Payroll for 2026-02-01 to 2026-02-04	2026-02-04 11:38:09.090086+00	1	3
\.


--
-- Data for Name: users_staffshift; Type: TABLE DATA; Schema: public; Owner: ikan_bakar_user
--

COPY public.users_staffshift (id, scheduled_start, scheduled_end, actual_start, actual_end, break_minutes, status, notes, created_at, restaurant_id, staff_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 176, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 11, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: bank_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.bank_account_id_seq', 17, true);


--
-- Name: bank_accountgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.bank_accountgroup_id_seq', 3, true);


--
-- Name: bank_journalentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.bank_journalentry_id_seq', 30, true);


--
-- Name: bank_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.bank_transaction_id_seq', 19, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 314, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 44, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 115, true);


--
-- Name: expenses_expense_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.expenses_expense_id_seq', 6, true);


--
-- Name: expenses_expensecategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.expenses_expensecategory_id_seq', 7, true);


--
-- Name: inventory_hygiene_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.inventory_hygiene_id_seq', 1, false);


--
-- Name: inventory_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.inventory_ingredient_id_seq', 61, true);


--
-- Name: inventory_inventorylocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.inventory_inventorylocation_id_seq', 1, false);


--
-- Name: inventory_inventorystock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.inventory_inventorystock_id_seq', 124, true);


--
-- Name: inventory_restockitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.inventory_restockitem_id_seq', 40, true);


--
-- Name: inventory_restockorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.inventory_restockorder_id_seq', 21, true);


--
-- Name: inventory_stockitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.inventory_stockitem_id_seq', 1, false);


--
-- Name: inventory_supplies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.inventory_supplies_id_seq', 12, true);


--
-- Name: menu_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.menu_category_id_seq', 6, true);


--
-- Name: menu_dish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.menu_dish_id_seq', 52, true);


--
-- Name: menu_dishingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.menu_dishingredient_id_seq', 59, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 50, true);


--
-- Name: orders_orderdish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.orders_orderdish_id_seq', 181, true);


--
-- Name: orders_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.orders_payment_id_seq', 3, true);


--
-- Name: orders_paymenttransaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.orders_paymenttransaction_id_seq', 1, false);


--
-- Name: orders_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.orders_table_id_seq', 20, true);


--
-- Name: pos_cashregister_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.pos_cashregister_id_seq', 1, false);


--
-- Name: pos_cashtransaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.pos_cashtransaction_id_seq', 1, false);


--
-- Name: pos_registeralert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.pos_registeralert_id_seq', 1, false);


--
-- Name: pos_registersession_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.pos_registersession_id_seq', 1, false);


--
-- Name: users_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.users_customer_id_seq', 1, true);


--
-- Name: users_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.users_restaurant_id_seq', 2, true);


--
-- Name: users_staffattendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.users_staffattendance_id_seq', 1, false);


--
-- Name: users_staffemployment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.users_staffemployment_id_seq', 1, true);


--
-- Name: users_staffleave_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.users_staffleave_id_seq', 1, false);


--
-- Name: users_staffmember_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.users_staffmember_id_seq', 8, true);


--
-- Name: users_staffpayroll_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.users_staffpayroll_id_seq', 2, true);


--
-- Name: users_staffshift_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ikan_bakar_user
--

SELECT pg_catalog.setval('public.users_staffshift_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: bank_account bank_account_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.bank_account
    ADD CONSTRAINT bank_account_pkey PRIMARY KEY (id);


--
-- Name: bank_accountgroup bank_accountgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.bank_accountgroup
    ADD CONSTRAINT bank_accountgroup_pkey PRIMARY KEY (id);


--
-- Name: bank_journalentry bank_journalentry_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.bank_journalentry
    ADD CONSTRAINT bank_journalentry_pkey PRIMARY KEY (id);


--
-- Name: bank_transaction bank_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.bank_transaction
    ADD CONSTRAINT bank_transaction_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: expenses_expense expenses_expense_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.expenses_expense
    ADD CONSTRAINT expenses_expense_pkey PRIMARY KEY (id);


--
-- Name: expenses_expense expenses_expense_transaction_id_key; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.expenses_expense
    ADD CONSTRAINT expenses_expense_transaction_id_key UNIQUE (transaction_id);


--
-- Name: expenses_expensecategory expenses_expensecategory_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.expenses_expensecategory
    ADD CONSTRAINT expenses_expensecategory_pkey PRIMARY KEY (id);


--
-- Name: expenses_expensecategory expenses_expensecategory_restaurant_id_name_9ae88fbc_uniq; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.expenses_expensecategory
    ADD CONSTRAINT expenses_expensecategory_restaurant_id_name_9ae88fbc_uniq UNIQUE (restaurant_id, name);


--
-- Name: inventory_hygiene inventory_hygiene_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_hygiene
    ADD CONSTRAINT inventory_hygiene_pkey PRIMARY KEY (id);


--
-- Name: inventory_ingredient inventory_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_ingredient
    ADD CONSTRAINT inventory_ingredient_pkey PRIMARY KEY (id);


--
-- Name: inventory_inventorylocation inventory_inventorylocation_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_inventorylocation
    ADD CONSTRAINT inventory_inventorylocation_pkey PRIMARY KEY (id);


--
-- Name: inventory_inventorystock inventory_inventorystock_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_inventorystock
    ADD CONSTRAINT inventory_inventorystock_pkey PRIMARY KEY (id);


--
-- Name: inventory_inventorystock inventory_inventorystock_restaurant_id_hygiene_id_55b108c4_uniq; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_inventorystock
    ADD CONSTRAINT inventory_inventorystock_restaurant_id_hygiene_id_55b108c4_uniq UNIQUE (restaurant_id, hygiene_id);


--
-- Name: inventory_inventorystock inventory_inventorystock_restaurant_id_ingredient_ecdb322a_uniq; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_inventorystock
    ADD CONSTRAINT inventory_inventorystock_restaurant_id_ingredient_ecdb322a_uniq UNIQUE (restaurant_id, ingredient_id);


--
-- Name: inventory_inventorystock inventory_inventorystock_restaurant_id_supplies_i_c1d33a71_uniq; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_inventorystock
    ADD CONSTRAINT inventory_inventorystock_restaurant_id_supplies_i_c1d33a71_uniq UNIQUE (restaurant_id, supplies_id);


--
-- Name: inventory_restockitem inventory_restockitem_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_restockitem
    ADD CONSTRAINT inventory_restockitem_pkey PRIMARY KEY (id);


--
-- Name: inventory_restockorder inventory_restockorder_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_restockorder
    ADD CONSTRAINT inventory_restockorder_pkey PRIMARY KEY (id);


--
-- Name: inventory_stockitem inventory_stockitem_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_stockitem
    ADD CONSTRAINT inventory_stockitem_pkey PRIMARY KEY (id);


--
-- Name: inventory_supplies inventory_supplies_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_supplies
    ADD CONSTRAINT inventory_supplies_pkey PRIMARY KEY (id);


--
-- Name: menu_category menu_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.menu_category
    ADD CONSTRAINT menu_category_pkey PRIMARY KEY (id);


--
-- Name: menu_dish menu_dish_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.menu_dish
    ADD CONSTRAINT menu_dish_pkey PRIMARY KEY (id);


--
-- Name: menu_dishingredient menu_dishingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.menu_dishingredient
    ADD CONSTRAINT menu_dishingredient_pkey PRIMARY KEY (id);


--
-- Name: orders_order orders_order_order_number_key; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_order_number_key UNIQUE (order_number);


--
-- Name: orders_order orders_order_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_pkey PRIMARY KEY (id);


--
-- Name: orders_orderdish orders_orderdish_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.orders_orderdish
    ADD CONSTRAINT orders_orderdish_pkey PRIMARY KEY (id);


--
-- Name: orders_payment orders_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.orders_payment
    ADD CONSTRAINT orders_payment_pkey PRIMARY KEY (id);


--
-- Name: orders_paymenttransaction orders_paymenttransaction_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.orders_paymenttransaction
    ADD CONSTRAINT orders_paymenttransaction_pkey PRIMARY KEY (id);


--
-- Name: orders_table orders_table_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.orders_table
    ADD CONSTRAINT orders_table_pkey PRIMARY KEY (id);


--
-- Name: pos_cashregister pos_cashregister_name_restaurant_id_45173a39_uniq; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.pos_cashregister
    ADD CONSTRAINT pos_cashregister_name_restaurant_id_45173a39_uniq UNIQUE (name, restaurant_id);


--
-- Name: pos_cashregister pos_cashregister_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.pos_cashregister
    ADD CONSTRAINT pos_cashregister_pkey PRIMARY KEY (id);


--
-- Name: pos_cashtransaction pos_cashtransaction_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.pos_cashtransaction
    ADD CONSTRAINT pos_cashtransaction_pkey PRIMARY KEY (id);


--
-- Name: pos_registeralert pos_registeralert_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.pos_registeralert
    ADD CONSTRAINT pos_registeralert_pkey PRIMARY KEY (id);


--
-- Name: pos_registersession pos_registersession_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.pos_registersession
    ADD CONSTRAINT pos_registersession_pkey PRIMARY KEY (id);


--
-- Name: users_customer users_customer_phone_key; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_customer
    ADD CONSTRAINT users_customer_phone_key UNIQUE (phone);


--
-- Name: users_customer users_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_customer
    ADD CONSTRAINT users_customer_pkey PRIMARY KEY (id);


--
-- Name: users_customer users_customer_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_customer
    ADD CONSTRAINT users_customer_user_id_key UNIQUE (user_id);


--
-- Name: users_restaurant users_restaurant_code_key; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_restaurant
    ADD CONSTRAINT users_restaurant_code_key UNIQUE (code);


--
-- Name: users_restaurant users_restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_restaurant
    ADD CONSTRAINT users_restaurant_pkey PRIMARY KEY (id);


--
-- Name: users_staffattendance users_staffattendance_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffattendance
    ADD CONSTRAINT users_staffattendance_pkey PRIMARY KEY (id);


--
-- Name: users_staffattendance users_staffattendance_staff_id_date_c123e3d5_uniq; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffattendance
    ADD CONSTRAINT users_staffattendance_staff_id_date_c123e3d5_uniq UNIQUE (staff_id, date);


--
-- Name: users_staffemployment users_staffemployment_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffemployment
    ADD CONSTRAINT users_staffemployment_pkey PRIMARY KEY (id);


--
-- Name: users_staffleave users_staffleave_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffleave
    ADD CONSTRAINT users_staffleave_pkey PRIMARY KEY (id);


--
-- Name: users_staffmember users_staffmember_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffmember
    ADD CONSTRAINT users_staffmember_pkey PRIMARY KEY (id);


--
-- Name: users_staffmember users_staffmember_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffmember
    ADD CONSTRAINT users_staffmember_user_id_key UNIQUE (user_id);


--
-- Name: users_staffpayroll users_staffpayroll_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffpayroll
    ADD CONSTRAINT users_staffpayroll_pkey PRIMARY KEY (id);


--
-- Name: users_staffpayroll users_staffpayroll_staff_id_period_start_pe_abdd7762_uniq; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffpayroll
    ADD CONSTRAINT users_staffpayroll_staff_id_period_start_pe_abdd7762_uniq UNIQUE (staff_id, period_start, period_end);


--
-- Name: users_staffshift users_staffshift_pkey; Type: CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffshift
    ADD CONSTRAINT users_staffshift_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: bank_account_group_id_70af62e9; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX bank_account_group_id_70af62e9 ON public.bank_account USING btree (group_id);


--
-- Name: bank_account_restaurant_id_98f45ae4; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX bank_account_restaurant_id_98f45ae4 ON public.bank_account USING btree (restaurant_id);


--
-- Name: bank_journalentry_account_id_9efacffb; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX bank_journalentry_account_id_9efacffb ON public.bank_journalentry USING btree (account_id);


--
-- Name: bank_journalentry_transaction_id_fa57c6f5; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX bank_journalentry_transaction_id_fa57c6f5 ON public.bank_journalentry USING btree (transaction_id);


--
-- Name: bank_transaction_related_order_id_95fa0b56; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX bank_transaction_related_order_id_95fa0b56 ON public.bank_transaction USING btree (related_order_id);


--
-- Name: bank_transaction_restaurant_id_79b979f0; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX bank_transaction_restaurant_id_79b979f0 ON public.bank_transaction USING btree (restaurant_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: expenses_expense_category_id_aa33bbdd; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX expenses_expense_category_id_aa33bbdd ON public.expenses_expense USING btree (category_id);


--
-- Name: expenses_expense_payment_account_id_9abbe10b; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX expenses_expense_payment_account_id_9abbe10b ON public.expenses_expense USING btree (payment_account_id);


--
-- Name: expenses_expense_restaurant_id_58246625; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX expenses_expense_restaurant_id_58246625 ON public.expenses_expense USING btree (restaurant_id);


--
-- Name: expenses_expensecategory_account_id_efff0591; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX expenses_expensecategory_account_id_efff0591 ON public.expenses_expensecategory USING btree (account_id);


--
-- Name: expenses_expensecategory_restaurant_id_5eb6a2bd; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX expenses_expensecategory_restaurant_id_5eb6a2bd ON public.expenses_expensecategory USING btree (restaurant_id);


--
-- Name: inventory_inventorylocation_restaurant_id_465a284a; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX inventory_inventorylocation_restaurant_id_465a284a ON public.inventory_inventorylocation USING btree (restaurant_id);


--
-- Name: inventory_inventorystock_hygiene_id_c10ae46b; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX inventory_inventorystock_hygiene_id_c10ae46b ON public.inventory_inventorystock USING btree (hygiene_id);


--
-- Name: inventory_inventorystock_ingredient_id_6267079a; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX inventory_inventorystock_ingredient_id_6267079a ON public.inventory_inventorystock USING btree (ingredient_id);


--
-- Name: inventory_inventorystock_restaurant_id_530ccc71; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX inventory_inventorystock_restaurant_id_530ccc71 ON public.inventory_inventorystock USING btree (restaurant_id);


--
-- Name: inventory_inventorystock_supplies_id_4651796d; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX inventory_inventorystock_supplies_id_4651796d ON public.inventory_inventorystock USING btree (supplies_id);


--
-- Name: inventory_restockitem_restock_order_id_76e87831; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX inventory_restockitem_restock_order_id_76e87831 ON public.inventory_restockitem USING btree (restock_order_id);


--
-- Name: inventory_restockorder_restaurant_id_afea1047; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX inventory_restockorder_restaurant_id_afea1047 ON public.inventory_restockorder USING btree (restaurant_id);


--
-- Name: inventory_stockitem_restaurant_id_a744d075; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX inventory_stockitem_restaurant_id_a744d075 ON public.inventory_stockitem USING btree (restaurant_id);


--
-- Name: menu_dish_category_id_16b2903d; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX menu_dish_category_id_16b2903d ON public.menu_dish USING btree (category_id);


--
-- Name: menu_dishingredient_dish_id_47ac620a; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX menu_dishingredient_dish_id_47ac620a ON public.menu_dishingredient USING btree (dish_id);


--
-- Name: menu_dishingredient_ingredient_id_47a5f632; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX menu_dishingredient_ingredient_id_47a5f632 ON public.menu_dishingredient USING btree (ingredient_id);


--
-- Name: orders_order_created_by_id_d5f5e69c; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX orders_order_created_by_id_d5f5e69c ON public.orders_order USING btree (created_by_id);


--
-- Name: orders_order_order_number_4e985f70_like; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX orders_order_order_number_4e985f70_like ON public.orders_order USING btree (order_number varchar_pattern_ops);


--
-- Name: orders_order_restaurant_id_a38fbfc0; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX orders_order_restaurant_id_a38fbfc0 ON public.orders_order USING btree (restaurant_id);


--
-- Name: orders_order_table_id_14015bc1; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX orders_order_table_id_14015bc1 ON public.orders_order USING btree (table_id);


--
-- Name: orders_orderdish_dish_id_d25f0b23; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX orders_orderdish_dish_id_d25f0b23 ON public.orders_orderdish USING btree (dish_id);


--
-- Name: orders_orderdish_order_id_979b1d80; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX orders_orderdish_order_id_979b1d80 ON public.orders_orderdish USING btree (order_id);


--
-- Name: orders_payment_order_id_bdccf250; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX orders_payment_order_id_bdccf250 ON public.orders_payment USING btree (order_id);


--
-- Name: orders_paymenttransaction_payment_id_2ae7371f; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX orders_paymenttransaction_payment_id_2ae7371f ON public.orders_paymenttransaction USING btree (payment_id);


--
-- Name: orders_table_restaurant_id_86b046c6; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX orders_table_restaurant_id_86b046c6 ON public.orders_table USING btree (restaurant_id);


--
-- Name: pos_cashregister_restaurant_id_3408636c; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX pos_cashregister_restaurant_id_3408636c ON public.pos_cashregister USING btree (restaurant_id);


--
-- Name: pos_cashtransaction_created_by_id_cd1aa229; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX pos_cashtransaction_created_by_id_cd1aa229 ON public.pos_cashtransaction USING btree (created_by_id);


--
-- Name: pos_cashtransaction_reference_order_id_3ec516e4; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX pos_cashtransaction_reference_order_id_3ec516e4 ON public.pos_cashtransaction USING btree (reference_order_id);


--
-- Name: pos_cashtransaction_session_id_820aecee; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX pos_cashtransaction_session_id_820aecee ON public.pos_cashtransaction USING btree (session_id);


--
-- Name: pos_registeralert_acknowledged_by_id_34aebb2e; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX pos_registeralert_acknowledged_by_id_34aebb2e ON public.pos_registeralert USING btree (acknowledged_by_id);


--
-- Name: pos_registeralert_register_id_a3dfce54; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX pos_registeralert_register_id_a3dfce54 ON public.pos_registeralert USING btree (register_id);


--
-- Name: pos_registeralert_session_id_d7df18f4; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX pos_registeralert_session_id_d7df18f4 ON public.pos_registeralert USING btree (session_id);


--
-- Name: pos_registersession_register_id_bcc9d251; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX pos_registersession_register_id_bcc9d251 ON public.pos_registersession USING btree (register_id);


--
-- Name: pos_registersession_staff_member_id_b1c41646; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX pos_registersession_staff_member_id_b1c41646 ON public.pos_registersession USING btree (staff_member_id);


--
-- Name: users_customer_phone_3d9288bb_like; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_customer_phone_3d9288bb_like ON public.users_customer USING btree (phone varchar_pattern_ops);


--
-- Name: users_restaurant_code_05b5e6e0_like; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_restaurant_code_05b5e6e0_like ON public.users_restaurant USING btree (code varchar_pattern_ops);


--
-- Name: users_staff_restaur_4f62e0_idx; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staff_restaur_4f62e0_idx ON public.users_staffleave USING btree (restaurant_id, status);


--
-- Name: users_staff_restaur_595dae_idx; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staff_restaur_595dae_idx ON public.users_staffemployment USING btree (restaurant_id, employment_type);


--
-- Name: users_staff_restaur_5e83cc_idx; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staff_restaur_5e83cc_idx ON public.users_staffpayroll USING btree (restaurant_id, period_start, period_end);


--
-- Name: users_staff_restaur_93ba40_idx; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staff_restaur_93ba40_idx ON public.users_staffshift USING btree (restaurant_id, status);


--
-- Name: users_staff_restaur_fbd834_idx; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staff_restaur_fbd834_idx ON public.users_staffattendance USING btree (restaurant_id, date);


--
-- Name: users_staff_staff_i_1525a4_idx; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staff_staff_i_1525a4_idx ON public.users_staffleave USING btree (staff_id, start_date);


--
-- Name: users_staff_staff_i_65f325_idx; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staff_staff_i_65f325_idx ON public.users_staffpayroll USING btree (staff_id, status);


--
-- Name: users_staff_staff_i_79c51c_idx; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staff_staff_i_79c51c_idx ON public.users_staffshift USING btree (staff_id, scheduled_start);


--
-- Name: users_staff_staff_i_9eb4cb_idx; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staff_staff_i_9eb4cb_idx ON public.users_staffemployment USING btree (staff_id, is_current);


--
-- Name: users_staff_status_ca3a53_idx; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staff_status_ca3a53_idx ON public.users_staffattendance USING btree (status);


--
-- Name: users_staffattendance_restaurant_id_a4c2f5e2; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staffattendance_restaurant_id_a4c2f5e2 ON public.users_staffattendance USING btree (restaurant_id);


--
-- Name: users_staffattendance_staff_id_4c250477; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staffattendance_staff_id_4c250477 ON public.users_staffattendance USING btree (staff_id);


--
-- Name: users_staffemployment_restaurant_id_d0127cf7; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staffemployment_restaurant_id_d0127cf7 ON public.users_staffemployment USING btree (restaurant_id);


--
-- Name: users_staffemployment_staff_id_51e77011; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staffemployment_staff_id_51e77011 ON public.users_staffemployment USING btree (staff_id);


--
-- Name: users_staffleave_approved_by_id_47f4c2e0; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staffleave_approved_by_id_47f4c2e0 ON public.users_staffleave USING btree (approved_by_id);


--
-- Name: users_staffleave_restaurant_id_803e71db; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staffleave_restaurant_id_803e71db ON public.users_staffleave USING btree (restaurant_id);


--
-- Name: users_staffleave_staff_id_fe563a7a; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staffleave_staff_id_fe563a7a ON public.users_staffleave USING btree (staff_id);


--
-- Name: users_staffmember_restaurant_id_0049184f; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staffmember_restaurant_id_0049184f ON public.users_staffmember USING btree (restaurant_id);


--
-- Name: users_staffpayroll_restaurant_id_76db0638; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staffpayroll_restaurant_id_76db0638 ON public.users_staffpayroll USING btree (restaurant_id);


--
-- Name: users_staffpayroll_staff_id_8c81bceb; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staffpayroll_staff_id_8c81bceb ON public.users_staffpayroll USING btree (staff_id);


--
-- Name: users_staffshift_restaurant_id_6c133996; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staffshift_restaurant_id_6c133996 ON public.users_staffshift USING btree (restaurant_id);


--
-- Name: users_staffshift_staff_id_c07810d3; Type: INDEX; Schema: public; Owner: ikan_bakar_user
--

CREATE INDEX users_staffshift_staff_id_c07810d3 ON public.users_staffshift USING btree (staff_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bank_account bank_account_group_id_70af62e9_fk_bank_accountgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.bank_account
    ADD CONSTRAINT bank_account_group_id_70af62e9_fk_bank_accountgroup_id FOREIGN KEY (group_id) REFERENCES public.bank_accountgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bank_account bank_account_restaurant_id_98f45ae4_fk_users_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.bank_account
    ADD CONSTRAINT bank_account_restaurant_id_98f45ae4_fk_users_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.users_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bank_journalentry bank_journalentry_account_id_9efacffb_fk_bank_account_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.bank_journalentry
    ADD CONSTRAINT bank_journalentry_account_id_9efacffb_fk_bank_account_id FOREIGN KEY (account_id) REFERENCES public.bank_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bank_journalentry bank_journalentry_transaction_id_fa57c6f5_fk_bank_tran; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.bank_journalentry
    ADD CONSTRAINT bank_journalentry_transaction_id_fa57c6f5_fk_bank_tran FOREIGN KEY (transaction_id) REFERENCES public.bank_transaction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bank_transaction bank_transaction_related_order_id_95fa0b56_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.bank_transaction
    ADD CONSTRAINT bank_transaction_related_order_id_95fa0b56_fk_orders_order_id FOREIGN KEY (related_order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bank_transaction bank_transaction_restaurant_id_79b979f0_fk_users_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.bank_transaction
    ADD CONSTRAINT bank_transaction_restaurant_id_79b979f0_fk_users_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.users_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_expense expenses_expense_category_id_aa33bbdd_fk_expenses_; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.expenses_expense
    ADD CONSTRAINT expenses_expense_category_id_aa33bbdd_fk_expenses_ FOREIGN KEY (category_id) REFERENCES public.expenses_expensecategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_expense expenses_expense_payment_account_id_9abbe10b_fk_bank_account_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.expenses_expense
    ADD CONSTRAINT expenses_expense_payment_account_id_9abbe10b_fk_bank_account_id FOREIGN KEY (payment_account_id) REFERENCES public.bank_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_expense expenses_expense_restaurant_id_58246625_fk_users_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.expenses_expense
    ADD CONSTRAINT expenses_expense_restaurant_id_58246625_fk_users_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.users_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_expense expenses_expense_transaction_id_e148c4fc_fk_bank_transaction_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.expenses_expense
    ADD CONSTRAINT expenses_expense_transaction_id_e148c4fc_fk_bank_transaction_id FOREIGN KEY (transaction_id) REFERENCES public.bank_transaction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_expensecategory expenses_expensecate_restaurant_id_5eb6a2bd_fk_users_res; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.expenses_expensecategory
    ADD CONSTRAINT expenses_expensecate_restaurant_id_5eb6a2bd_fk_users_res FOREIGN KEY (restaurant_id) REFERENCES public.users_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: expenses_expensecategory expenses_expensecategory_account_id_efff0591_fk_bank_account_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.expenses_expensecategory
    ADD CONSTRAINT expenses_expensecategory_account_id_efff0591_fk_bank_account_id FOREIGN KEY (account_id) REFERENCES public.bank_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_inventorylocation inventory_inventoryl_restaurant_id_465a284a_fk_users_res; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_inventorylocation
    ADD CONSTRAINT inventory_inventoryl_restaurant_id_465a284a_fk_users_res FOREIGN KEY (restaurant_id) REFERENCES public.users_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_inventorystock inventory_inventorys_hygiene_id_c10ae46b_fk_inventory; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_inventorystock
    ADD CONSTRAINT inventory_inventorys_hygiene_id_c10ae46b_fk_inventory FOREIGN KEY (hygiene_id) REFERENCES public.inventory_hygiene(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_inventorystock inventory_inventorys_ingredient_id_6267079a_fk_inventory; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_inventorystock
    ADD CONSTRAINT inventory_inventorys_ingredient_id_6267079a_fk_inventory FOREIGN KEY (ingredient_id) REFERENCES public.inventory_ingredient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_inventorystock inventory_inventorys_restaurant_id_530ccc71_fk_users_res; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_inventorystock
    ADD CONSTRAINT inventory_inventorys_restaurant_id_530ccc71_fk_users_res FOREIGN KEY (restaurant_id) REFERENCES public.users_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_inventorystock inventory_inventorys_supplies_id_4651796d_fk_inventory; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_inventorystock
    ADD CONSTRAINT inventory_inventorys_supplies_id_4651796d_fk_inventory FOREIGN KEY (supplies_id) REFERENCES public.inventory_supplies(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_restockitem inventory_restockite_restock_order_id_76e87831_fk_inventory; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_restockitem
    ADD CONSTRAINT inventory_restockite_restock_order_id_76e87831_fk_inventory FOREIGN KEY (restock_order_id) REFERENCES public.inventory_restockorder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_restockorder inventory_restockord_restaurant_id_afea1047_fk_users_res; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_restockorder
    ADD CONSTRAINT inventory_restockord_restaurant_id_afea1047_fk_users_res FOREIGN KEY (restaurant_id) REFERENCES public.users_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: inventory_stockitem inventory_stockitem_restaurant_id_a744d075_fk_users_res; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.inventory_stockitem
    ADD CONSTRAINT inventory_stockitem_restaurant_id_a744d075_fk_users_res FOREIGN KEY (restaurant_id) REFERENCES public.users_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_dish menu_dish_category_id_16b2903d_fk_menu_category_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.menu_dish
    ADD CONSTRAINT menu_dish_category_id_16b2903d_fk_menu_category_id FOREIGN KEY (category_id) REFERENCES public.menu_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_dishingredient menu_dishingredient_dish_id_47ac620a_fk_menu_dish_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.menu_dishingredient
    ADD CONSTRAINT menu_dishingredient_dish_id_47ac620a_fk_menu_dish_id FOREIGN KEY (dish_id) REFERENCES public.menu_dish(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_dishingredient menu_dishingredient_ingredient_id_47a5f632_fk_inventory; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.menu_dishingredient
    ADD CONSTRAINT menu_dishingredient_ingredient_id_47a5f632_fk_inventory FOREIGN KEY (ingredient_id) REFERENCES public.inventory_ingredient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order orders_order_created_by_id_d5f5e69c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_created_by_id_d5f5e69c_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order orders_order_restaurant_id_a38fbfc0_fk_users_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_restaurant_id_a38fbfc0_fk_users_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.users_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order orders_order_table_id_14015bc1_fk_orders_table_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_table_id_14015bc1_fk_orders_table_id FOREIGN KEY (table_id) REFERENCES public.orders_table(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orderdish orders_orderdish_dish_id_d25f0b23_fk_menu_dish_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.orders_orderdish
    ADD CONSTRAINT orders_orderdish_dish_id_d25f0b23_fk_menu_dish_id FOREIGN KEY (dish_id) REFERENCES public.menu_dish(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orderdish orders_orderdish_order_id_979b1d80_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.orders_orderdish
    ADD CONSTRAINT orders_orderdish_order_id_979b1d80_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_payment orders_payment_order_id_bdccf250_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.orders_payment
    ADD CONSTRAINT orders_payment_order_id_bdccf250_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_paymenttransaction orders_paymenttransa_payment_id_2ae7371f_fk_orders_pa; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.orders_paymenttransaction
    ADD CONSTRAINT orders_paymenttransa_payment_id_2ae7371f_fk_orders_pa FOREIGN KEY (payment_id) REFERENCES public.orders_payment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_table orders_table_restaurant_id_86b046c6_fk_users_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.orders_table
    ADD CONSTRAINT orders_table_restaurant_id_86b046c6_fk_users_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.users_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pos_cashregister pos_cashregister_restaurant_id_3408636c_fk_users_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.pos_cashregister
    ADD CONSTRAINT pos_cashregister_restaurant_id_3408636c_fk_users_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.users_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pos_cashtransaction pos_cashtransaction_created_by_id_cd1aa229_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.pos_cashtransaction
    ADD CONSTRAINT pos_cashtransaction_created_by_id_cd1aa229_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pos_cashtransaction pos_cashtransaction_reference_order_id_3ec516e4_fk_orders_or; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.pos_cashtransaction
    ADD CONSTRAINT pos_cashtransaction_reference_order_id_3ec516e4_fk_orders_or FOREIGN KEY (reference_order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pos_cashtransaction pos_cashtransaction_session_id_820aecee_fk_pos_regis; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.pos_cashtransaction
    ADD CONSTRAINT pos_cashtransaction_session_id_820aecee_fk_pos_regis FOREIGN KEY (session_id) REFERENCES public.pos_registersession(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pos_registeralert pos_registeralert_acknowledged_by_id_34aebb2e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.pos_registeralert
    ADD CONSTRAINT pos_registeralert_acknowledged_by_id_34aebb2e_fk_auth_user_id FOREIGN KEY (acknowledged_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pos_registeralert pos_registeralert_register_id_a3dfce54_fk_pos_cashregister_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.pos_registeralert
    ADD CONSTRAINT pos_registeralert_register_id_a3dfce54_fk_pos_cashregister_id FOREIGN KEY (register_id) REFERENCES public.pos_cashregister(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pos_registeralert pos_registeralert_session_id_d7df18f4_fk_pos_registersession_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.pos_registeralert
    ADD CONSTRAINT pos_registeralert_session_id_d7df18f4_fk_pos_registersession_id FOREIGN KEY (session_id) REFERENCES public.pos_registersession(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pos_registersession pos_registersession_register_id_bcc9d251_fk_pos_cashregister_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.pos_registersession
    ADD CONSTRAINT pos_registersession_register_id_bcc9d251_fk_pos_cashregister_id FOREIGN KEY (register_id) REFERENCES public.pos_cashregister(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pos_registersession pos_registersession_staff_member_id_b1c41646_fk_users_sta; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.pos_registersession
    ADD CONSTRAINT pos_registersession_staff_member_id_b1c41646_fk_users_sta FOREIGN KEY (staff_member_id) REFERENCES public.users_staffmember(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_customer users_customer_user_id_a09bb4be_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_customer
    ADD CONSTRAINT users_customer_user_id_a09bb4be_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_staffattendance users_staffattendanc_restaurant_id_a4c2f5e2_fk_users_res; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffattendance
    ADD CONSTRAINT users_staffattendanc_restaurant_id_a4c2f5e2_fk_users_res FOREIGN KEY (restaurant_id) REFERENCES public.users_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_staffattendance users_staffattendance_staff_id_4c250477_fk_users_staffmember_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffattendance
    ADD CONSTRAINT users_staffattendance_staff_id_4c250477_fk_users_staffmember_id FOREIGN KEY (staff_id) REFERENCES public.users_staffmember(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_staffemployment users_staffemploymen_restaurant_id_d0127cf7_fk_users_res; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffemployment
    ADD CONSTRAINT users_staffemploymen_restaurant_id_d0127cf7_fk_users_res FOREIGN KEY (restaurant_id) REFERENCES public.users_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_staffemployment users_staffemployment_staff_id_51e77011_fk_users_staffmember_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffemployment
    ADD CONSTRAINT users_staffemployment_staff_id_51e77011_fk_users_staffmember_id FOREIGN KEY (staff_id) REFERENCES public.users_staffmember(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_staffleave users_staffleave_approved_by_id_47f4c2e0_fk_users_sta; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffleave
    ADD CONSTRAINT users_staffleave_approved_by_id_47f4c2e0_fk_users_sta FOREIGN KEY (approved_by_id) REFERENCES public.users_staffmember(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_staffleave users_staffleave_restaurant_id_803e71db_fk_users_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffleave
    ADD CONSTRAINT users_staffleave_restaurant_id_803e71db_fk_users_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.users_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_staffleave users_staffleave_staff_id_fe563a7a_fk_users_staffmember_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffleave
    ADD CONSTRAINT users_staffleave_staff_id_fe563a7a_fk_users_staffmember_id FOREIGN KEY (staff_id) REFERENCES public.users_staffmember(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_staffmember users_staffmember_restaurant_id_0049184f_fk_users_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffmember
    ADD CONSTRAINT users_staffmember_restaurant_id_0049184f_fk_users_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.users_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_staffmember users_staffmember_user_id_3f3e1d1c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffmember
    ADD CONSTRAINT users_staffmember_user_id_3f3e1d1c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_staffpayroll users_staffpayroll_restaurant_id_76db0638_fk_users_res; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffpayroll
    ADD CONSTRAINT users_staffpayroll_restaurant_id_76db0638_fk_users_res FOREIGN KEY (restaurant_id) REFERENCES public.users_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_staffpayroll users_staffpayroll_staff_id_8c81bceb_fk_users_staffmember_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffpayroll
    ADD CONSTRAINT users_staffpayroll_staff_id_8c81bceb_fk_users_staffmember_id FOREIGN KEY (staff_id) REFERENCES public.users_staffmember(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_staffshift users_staffshift_restaurant_id_6c133996_fk_users_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffshift
    ADD CONSTRAINT users_staffshift_restaurant_id_6c133996_fk_users_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.users_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_staffshift users_staffshift_staff_id_c07810d3_fk_users_staffmember_id; Type: FK CONSTRAINT; Schema: public; Owner: ikan_bakar_user
--

ALTER TABLE ONLY public.users_staffshift
    ADD CONSTRAINT users_staffshift_staff_id_c07810d3_fk_users_staffmember_id FOREIGN KEY (staff_id) REFERENCES public.users_staffmember(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\unrestrict QHcf8f4gVGJE3sUBqlYjqYrpTAk16UgyJCoriHAzdlZ8X1jVE5dvOiMIGho3q5v

