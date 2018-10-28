Require Export List.
Require Export Bool.
Require Export Arith.
Require Export Peano_dec.
Require Export Coq.Arith.PeanoNat.
Require Import CpdtTactics.
Require Import definitions.
Require Import common.
Require Import weakening.
Require Import subst.
Set Implicit Arguments.

  



  






    Lemma range_unbound_ty_arr :
      forall i1 i2 t1 t2, [i1 dots i2] runbound_t (t1 arr t2) <-> ([i1 dots i2] runbound_t t1 /\
                                              [i1 dots i2] runbound_t t2).
    Proof.
      split; intros.
      
      split; intros n' Hge Hlt;
        apply H in Hge;
        apply Hge in Hlt;
        inversion Hlt; eauto.

      destruct H as [Ha Hb].
      intros n' Hge Hlt.
      crush.
    Qed.

    Hint Rewrite range_unbound_ty_arr.
    Hint Resolve range_unbound_ty_arr.
    
    Lemma range_unbound_ty_sel :
      forall i1 i2 p l, [i1 dots i2] runbound_t (sel p l) <-> ([i1 dots i2] runbound_e p).
    Proof.
      split; intros.
      
      intros n' Hge Hlt;
        apply H in Hge;
        apply Hge in Hlt;
        inversion Hlt; eauto.

      intros n' Hge Hlt;
        crush.
    Qed.

    Hint Rewrite range_unbound_ty_sel.
    Hint Resolve range_unbound_ty_sel.
    
    Lemma range_unbound_ty_str :
      forall i1 i2 ss, [i1 dots i2] runbound_t (str ss) <-> ([i1 dots i2] runbound_ss ss).
    Proof.
      split; intros.
      
      intros n' Hge Hlt;
        apply H in Hge;
        apply Hge in Hlt;
        inversion Hlt; eauto.

      intros n' Hge Hlt;
        crush.
    Qed.

    Hint Rewrite range_unbound_ty_str.
    Hint Resolve range_unbound_ty_str.
    
    Lemma range_unbound_decl_ty_upper :
      forall i1 i2 l t, [i1 dots i2] runbound_s (type l ext t) <-> ([i1 dots i2] runbound_t t).
    Proof.
      split; intros.
      
      intros n' Hge Hlt;
        apply H in Hge;
        apply Hge in Hlt;
        inversion Hlt; eauto.

      intros n' Hge Hlt;
        crush.
    Qed.

    Hint Rewrite range_unbound_decl_ty_upper.
    Hint Resolve range_unbound_decl_ty_upper.
    
    Lemma range_unbound_decl_ty_lower :
      forall i1 i2 l t, [i1 dots i2] runbound_s (type l sup t) <-> ([i1 dots i2] runbound_t t).
    Proof.
      split; intros.
      
      intros n' Hge Hlt;
        apply H in Hge;
        apply Hge in Hlt;
        inversion Hlt; eauto.

      intros n' Hge Hlt;
        crush.
    Qed.

    Hint Rewrite range_unbound_decl_ty_lower.
    Hint Resolve range_unbound_decl_ty_lower.
    
    Lemma range_unbound_decl_ty_equal :
      forall i1 i2 l t, [i1 dots i2] runbound_s (type l eqt t) <-> ([i1 dots i2] runbound_t t).
    Proof.
      split; intros.
      
      intros n' Hge Hlt;
        apply H in Hge;
        apply Hge in Hlt;
        inversion Hlt; eauto.

      intros n' Hge Hlt;
        crush.
    Qed.

    Hint Rewrite range_unbound_decl_ty_equal.
    Hint Resolve range_unbound_decl_ty_equal.
    
    Lemma range_unbound_decl_ty_value :
      forall i1 i2 l t, [i1 dots i2] runbound_s (val l oft t) <-> ([i1 dots i2] runbound_t t).
    Proof.
      split; intros.
      
      intros n' Hge Hlt;
        apply H in Hge;
        apply Hge in Hlt;
        inversion Hlt; eauto.

      intros n' Hge Hlt;
        crush.
    Qed.

    Hint Rewrite range_unbound_decl_ty_value.
    Hint Resolve range_unbound_decl_ty_value.
    
    Lemma range_unbound_decl_tys_nil :
      forall i1 i2, [i1 dots i2] runbound_ss dt_nil.
    Proof.
      intros n' Hge Hlt;
        crush.
    Qed.

    Hint Rewrite range_unbound_decl_tys_nil.
    Hint Resolve range_unbound_decl_tys_nil.
    
    Lemma range_unbound_decl_tys_cons :
      forall i1 i2 s ss, [i1 dots i2] runbound_ss (dt_con s ss) <-> ([i1 dots i2] runbound_s s /\
                                                 [i1 dots i2] runbound_ss ss).
    Proof.
      split; intros.
      
      split; intros n' Hge Hlt;
        apply H in Hge;
        apply Hge in Hlt;
        inversion Hlt; eauto.

      intros n' Hge Hlt;
        crush.
    Qed.

    Hint Rewrite range_unbound_decl_tys_cons.
    Hint Resolve range_unbound_decl_tys_cons.
    
    Lemma range_unbound_exp_loc :
      forall i1 i2 i, [i1 dots i2] runbound_e (i_ i).
    Proof.
      intros; crush.
      intros n' Hge Hlt;
        auto.
    Qed.

    Hint Rewrite range_unbound_exp_loc.
    Hint Resolve range_unbound_exp_loc.
    
    Lemma range_unbound_exp_cast :
      forall i1 i2 e t, [i1 dots i2] runbound_e (e cast t) <-> ([i1 dots i2] runbound_e e /\
                                          [i1 dots i2] runbound_t t).
    Proof.
      split; intros.
      
      split; intros n' Hge Hlt;
        apply H in Hge;
        apply Hge in Hlt;
        inversion Hlt; eauto.

      destruct H as [Ha Hb].
      intros n' Hge Hlt.
      crush.
    Qed.

    Hint Rewrite range_unbound_exp_cast.
    Hint Resolve range_unbound_exp_cast.
    
    Lemma range_unbound_exp_new :
      forall i1 i2 ds, [i1 dots i2] runbound_e (new ds) <-> ([i1 dots i2] runbound_ds ds).
    Proof.
      split; intros.
      
      intros n' Hge Hlt;
        apply H in Hge;
        apply Hge in Hlt;
        inversion Hlt; eauto.

      intros n' Hge Hlt.
      crush.
    Qed.

    Hint Rewrite range_unbound_exp_new.
    Hint Resolve range_unbound_exp_new.
    
    Lemma range_unbound_exp_app :
      forall i1 i2 e1 e2, [i1 dots i2] runbound_e (e_app e1 e2) <-> ([i1 dots i2] runbound_e e1 /\
                                                  [i1 dots i2] runbound_e e2).
    Proof.
      split; intros.
      
      split; intros n' Hge Hlt;
        apply H in Hge;
        apply Hge in Hlt;
        inversion Hlt; eauto.

      destruct H as [Ha Hb].
      intros n' Hge Hlt.
      crush.
    Qed.

    Hint Rewrite range_unbound_exp_app.
    Hint Resolve range_unbound_exp_app.
    
    Lemma range_unbound_exp_acc :
      forall i1 i2 e l, [i1 dots i2] runbound_e (e_acc e l) <-> ([i1 dots i2] runbound_e e).
    Proof.
      split; intros.
      
      intros n' Hge Hlt;
        apply H in Hge;
        apply Hge in Hlt;
        inversion Hlt; eauto.

      intros n' Hge Hlt.
      crush.
    Qed.

    Hint Rewrite range_unbound_exp_acc.
    Hint Resolve range_unbound_exp_acc.
    
    Lemma range_unbound_exp_fn :
      forall i1 i2 t1 e t2, [i1 dots i2] runbound_e (fn t1 in_exp e off t2) <-> ([i1 dots i2] runbound_t t1 /\
                                                      [i1 dots i2] runbound_e e /\
                                                      [i1 dots i2] runbound_t t2).
    Proof.
      split; intros.
      
      split; [|split]; intros n' Hge Hlt;
        apply H in Hge;
        apply Hge in Hlt;
        inversion Hlt; eauto.

      destruct H as [Ha Hb];
        destruct Hb as [Hb Hc].
      intros n' Hge Hlt.
      crush.
    Qed.

    Hint Rewrite range_unbound_exp_fn.
    Hint Resolve range_unbound_exp_fn.
    
    Lemma range_unbound_decl_value :
      forall i1 i2 l e t, [i1 dots i2] runbound_d (val l assgn e oft t) <-> ([i1 dots i2] runbound_e e /\
                                                    [i1 dots i2] runbound_t t).
    Proof.
      split; intros.
      
      split; intros n' Hge Hlt;
        apply H in Hge;
        apply Hge in Hlt;
        inversion Hlt; eauto.

      destruct H;
        intros n' Hge Hlt.
      crush.
    Qed.

    Hint Rewrite range_unbound_decl_value.
    Hint Resolve range_unbound_decl_value.
    
    Lemma range_unbound_decl_equal :
      forall i1 i2 l t, [i1 dots i2] runbound_d (type l eqe t) <-> ([i1 dots i2] runbound_t t).
    Proof.
      split; intros.
      
      intros n' Hge Hlt;
        apply H in Hge;
        apply Hge in Hlt;
        inversion Hlt; eauto.

      intros n' Hge Hlt.
      crush.
    Qed.

    Hint Rewrite range_unbound_decl_equal.
    Hint Resolve range_unbound_decl_equal.
    
    Lemma range_unbound_decls_nil :
      forall i1 i2, [i1 dots i2] runbound_ds d_nil.
    Proof.
      intros.
      intros n' Hge Hlt;
        auto.
    Qed.

    Hint Rewrite range_unbound_decls_nil.
    Hint Resolve range_unbound_decls_nil.
    
    Lemma range_unbound_decls_cons :
      forall i1 i2 d ds, [i1 dots i2] runbound_ds (d_con d ds) <-> ([i1 dots i2] runbound_d d /\
                                                [i1 dots i2] runbound_ds ds).
    Proof.
      split; intros.
      
      split; intros n' Hge Hlt;
        apply H in Hge;
        apply Hge in Hlt;
        inversion Hlt; eauto.

      intros n' Hge Hlt.
      crush.
    Qed.

    Hint Rewrite range_unbound_decls_cons.
    Hint Resolve range_unbound_decls_cons.

    Lemma ljump_cons :
      forall t G i n, ((t::G) [i] ljump_env n) = ((t [i] ljump_t n)::(G [i] ljump_env n)).
    Proof.
      intros.
      crush.
    Qed.

    Lemma range_unbound_subst_type :
      forall i1 i2 p n t, [i1 dots i2] runbound_t ([p /t n] t) ->
                     [i1 dots i2] runbound_t t.
    Proof.
      intros.
      intros n' Hge Hlt.
      eapply unbound_subst_type;
        eauto.
    Qed.

    Lemma range_unbound_subst_decl_tys :
      forall i1 i2 p n ss, [i1 dots i2] runbound_ss ([p /ss n] ss) ->
                      [i1 dots i2] runbound_ss ss.
    Proof.
      intros.
      intros n' Hge Hlt.
      eapply unbound_subst_decl_tys;
        eauto.
    Qed.

    Lemma range_unbound_subst_components_type :
      forall i1 i2 p n t, [i1 dots i2] runbound_e p ->
                     [i1 dots i2] runbound_t t ->
                     [i1 dots i2] runbound_t ([p /t n] t).
    Proof.
      intros.
      intros n' Hge Hlt.
      apply unbound_subst_components_type;
        crush.
    Qed.

    Lemma range_unbound_subst_components_decl_tys :
      forall i1 i2 p n ss, [i1 dots i2] runbound_e p ->
                      [i1 dots i2] runbound_ss ss ->
                      [i1 dots i2] runbound_ss ([p /ss n] ss).
    Proof.
      intros.
      intros n' Hge Hlt.
      apply unbound_subst_components_decl_tys;
        crush.
    Qed.

    Lemma range_unbound_subst_components_exp :
      forall i1 i2 p n e, [i1 dots i2] runbound_e p ->
                     [i1 dots i2] runbound_e e ->
                     [i1 dots i2] runbound_e ([p /e n] e).
    Proof.
      intros.
      intros n' Hge Hlt.
      apply unbound_subst_components_exp;
        crush.
    Qed.

    Lemma range_unbound_subst_components_decls :
      forall i1 i2 p n ds, [i1 dots i2] runbound_e p ->
                      [i1 dots i2] runbound_ds ds ->
                      [i1 dots i2] runbound_ds ([p /ds n] ds).
    Proof.
      intros.
      intros n' Hge Hlt.
      apply unbound_subst_components_decls;
        crush.
    Qed.

    Lemma range_unbound_cons :
      forall i1 i2 t G, [i1 dots i2] runbound_t t ->
                   [i1 dots i2] runbound_env G ->
                   [i1 dots i2] runbound_env (t::G).
    Proof.
      intros.
      intros t' Hin n' Hge Hlt.
      inversion Hin;
        subst;
        auto.
      apply H0; auto.
    Qed.
    
    Lemma subtyping_strengthening_mutind :
      (forall Sig G1 t1 t2 G2, Sig en G1 vdash t1 <; t2 dashv G2 ->
                  forall G3 G1' G4 G5 G2' G6,
                    G1 = (G3 ++ G1' ++ G4) ->
                    G2 = (G5 ++ G2' ++ G6) ->
                    forall i1 i2 n, i1 = length G4 ->
                               i1 = length G6 ->
                               i2 = length (G1' ++ G4) ->
                               i2 = length (G2' ++ G6) ->
                               n = length G1' ->
                               n = length G2' ->
                               [i1 dots i2] runbound_t t1 ->
                               [i1 dots i2] runbound_t t2 ->
                               [i1 dots i2] runbound_env G3 ->
                               [i1 dots i2] runbound_env G5 ->
                               [i1 dots i2] runbound_env G4 ->
                               [i1 dots i2] runbound_env G6 ->
                               [i1 dots i2] runbound_env Sig ->
                               (Sig [i2] ljump_env n) en (G3 [i2] ljump_env n) ++ (G4 [i2] ljump_env n) vdash
                                            (t1 [i2] ljump_t n) <; (t2 [i2] ljump_t n)
                                            dashv (G5 [i2] ljump_env n) ++ (G6 [i2] ljump_env n)) /\

      (forall Sig G1 s1 s2 G2, Sig en G1 vdash s1 <;; s2 dashv G2 ->
                  forall G3 G1' G4 G5 G2' G6,
                    G1 = (G3 ++ G1' ++ G4) ->
                    G2 = (G5 ++ G2' ++ G6) ->
                    forall i1 i2 n, i1 = length G4 ->
                               i1 = length G6 ->
                               i2 = length (G1' ++ G4) ->
                               i2 = length (G2' ++ G6) ->
                               n = length G1' ->
                               n = length G2' ->
                               [i1 dots i2] runbound_s s1 ->
                               [i1 dots i2] runbound_s s2 ->
                               [i1 dots i2] runbound_env G3 ->
                               [i1 dots i2] runbound_env G5 ->
                               [i1 dots i2] runbound_env G4 ->
                               [i1 dots i2] runbound_env G6 ->
                               [i1 dots i2] runbound_env Sig ->
                               (Sig [i2] ljump_env n) en (G3 [i2] ljump_env n) ++ (G4 [i2] ljump_env n) vdash
                                            (s1 [i2] ljump_s n) <;; (s2 [i2] ljump_s n)
                                            dashv (G5 [i2] ljump_env n) ++ (G6 [i2] ljump_env n)) /\

      (forall Sig G1 ss1 ss2 G2, Sig en G1 vdash ss1 <;;; ss2 dashv G2 ->
                  forall G3 G1' G4 G5 G2' G6,
                    G1 = (G3 ++ G1' ++ G4) ->
                    G2 = (G5 ++ G2' ++ G6) ->
                    forall i1 i2 n, i1 = length G4 ->
                               i1 = length G6 ->
                               i2 = length (G1' ++ G4) ->
                               i2 = length (G2' ++ G6) ->
                               n = length G1' ->
                               n = length G2' ->
                               [i1 dots i2] runbound_ss ss1 ->
                               [i1 dots i2] runbound_ss ss2 ->
                               [i1 dots i2] runbound_env G3 ->
                               [i1 dots i2] runbound_env G5 ->
                               [i1 dots i2] runbound_env G4 ->
                               [i1 dots i2] runbound_env G6 ->
                               [i1 dots i2] runbound_env Sig ->
                               (Sig [i2] ljump_env n) en (G3 [i2] ljump_env n) ++ (G4 [i2] ljump_env n) vdash
                                            (ss1 [i2] ljump_ss n) <;;; (ss2 [i2] ljump_ss n)
                                            dashv (G5 [i2] ljump_env n) ++ (G6 [i2] ljump_env n)).      
    Proof.
      apply sub_mutind; intros; simpl; auto.

      (*s-arr*)
      apply s_arr with (i:= length (G3 ++ G4)).
      
      eapply H; eauto;
        [eapply range_unbound_ty_arr with (t2:=t1');
         eauto
        |eapply range_unbound_ty_arr with (t2:=t2');
         eauto].
      repeat rewrite app_length;
        repeat rewrite ljump_length;
        auto.
      assert (Hrewrite1 : length G3 = length G5);
        [rewrite e0 in e;
         subst G1 G2;
         repeat rewrite app_length in e;
         crush|].
      repeat rewrite app_length;
        repeat rewrite ljump_length.
      rewrite Hrewrite1, <- H3, <- H4; auto.
      
      assert (Hrewrite1 : (t1 [i2]ljump_t n) :: (G3 [i2]ljump_env n) ++ (G4 [i2]ljump_env n) =
                          (t1 :: G3 [i2]ljump_env n) ++ (G4 [i2]ljump_env n));
        [crush|rewrite Hrewrite1].
      assert (Hrewrite2 : (t2 [i2]ljump_t n) :: (G5 [i2]ljump_env n) ++ (G6 [i2]ljump_env n) =
                          (t2 :: G5 [i2]ljump_env n) ++ (G6 [i2]ljump_env n));
        [crush|rewrite Hrewrite2].
      assert (Hrewrite3 : (c_ (length (G3 ++ G4))) =
                          ((c_ i) [i2] ljump_e n));
        [assert (Hle : i2 <= i);
         [subst i G1 i2;
          repeat rewrite app_length;
          crush
         |apply Nat.leb_le in Hle;
          simpl;
          unfold left_jump_n;
          rewrite Hle;
          subst i n G1;
          repeat rewrite app_length];
         rewrite plus_comm with (n:=length G1'), plus_assoc;
         rewrite <- Nat.add_sub_assoc;
         [rewrite Nat.sub_diag, Nat.add_0_r; auto|auto]
        |rewrite Hrewrite3].
      repeat rewrite <- ljump_subst_distr_type.

      assert (Hunbound_i : [i1 dots i2] runbound_e (c_ i));
        [intros n' Hge Hlt;
         apply ub_var, ub_con, Nat.lt_neq;
         subst i i2 G1;
         rewrite app_length;
         crush|].
        
      eapply H0; eauto.
      
      subst G1; auto.
      subst G2; auto.
      
      apply range_unbound_subst_components_type;
        [auto|eapply range_unbound_ty_arr; eauto].
      
      apply range_unbound_subst_components_type;
        [auto|eapply range_unbound_ty_arr; eauto].

      apply range_unbound_cons; auto;
        eapply range_unbound_ty_arr with (t2:=t1'); eauto.
      
      apply range_unbound_cons; auto;
        eapply range_unbound_ty_arr with (t2:=t2'); eauto.

      (*s select upper*)
      apply s_upper with (t1:=t1 [i2] ljump_t n).
      
      apply has_strengthening
        with
          (G1:=G3)(G2:=G4)
          (G':=G1')(n:=n)
          (i1:=i1)(i2:=i2)
        in h;
        auto;
        eapply range_unbound_ty_sel; eauto.

      eapply H; eauto.
      eapply has_range_unbound in h; eauto;
        [eapply range_unbound_decl_ty_upper; eauto
        |eapply range_unbound_ty_sel; eauto].

      (*s select lower*)
      apply s_lower with (t2:=t2 [i2] ljump_t n).
      
      apply has_strengthening
        with
          (G1:=G5)(G2:=G6)
          (G':=G2')(n:=n)
          (i1:=i1)(i2:=i2)
        in h;
        auto;
        eapply range_unbound_ty_sel; eauto.

      eapply H; eauto.
      eapply has_range_unbound in h; eauto;
        [eapply range_unbound_decl_ty_lower; eauto
        |eapply range_unbound_ty_sel; eauto].

      (*s select equal1*)
      apply s_equal1 with (t1:=t1 [i2] ljump_t n).
      
      apply has_strengthening
        with
          (G1:=G3)(G2:=G4)
          (G':=G1')(n:=n)
          (i1:=i1)(i2:=i2)
        in h;
        auto;
        eapply range_unbound_ty_sel; eauto.

      eapply H; eauto.
      eapply has_range_unbound in h; eauto;
        [eapply range_unbound_decl_ty_equal; eauto
        |eapply range_unbound_ty_sel; eauto].

      (*s select equal2*)
      apply s_equal2 with (t2:=t2 [i2] ljump_t n).
      
      apply has_strengthening
        with
          (G1:=G5)(G2:=G6)
          (G':=G2')(n:=n)
          (i1:=i1)(i2:=i2)
        in h;
        auto;
        eapply range_unbound_ty_sel; eauto.

      eapply H; eauto.
      eapply has_range_unbound in h; eauto;
        [eapply range_unbound_decl_ty_equal; eauto
        |eapply range_unbound_ty_sel; eauto].

      (*s struct*)

      assert (Hrewrite : length G3 = length G5);
        [subst G1 G2;
         rewrite app_length in e, e0;
         rewrite e0 in e;
         rewrite <- H4, <- H5 in e;
         apply Nat.add_cancel_r in e;
         auto
        |].
      
      apply s_struct with (i:=length (G3 ++ G4)).
      
      repeat rewrite app_length;
        repeat rewrite ljump_length;
        auto.
      
      repeat rewrite app_length;
        repeat rewrite ljump_length;
        rewrite Hrewrite, <- H2, <- H3;
        auto.
      
      assert (Hrewrite1 : ((str (ds1 [i2]ljump_ss n)) :: (G3 [i2]ljump_env n) ++ (G4 [i2]ljump_env n) =
                          ((str ds1) :: G3 [i2]ljump_env n) ++ (G4 [i2]ljump_env n)));
        [crush|rewrite Hrewrite1].
      assert (Hrewrite2 : ((str (ds2 [i2]ljump_ss n)) :: (G5 [i2]ljump_env n) ++ (G6 [i2]ljump_env n) =
                          ((str ds2) :: G5 [i2]ljump_env n) ++ (G6 [i2]ljump_env n)));
        [crush|rewrite Hrewrite2].
      assert (Hrewrite3 : (c_ (length (G3 ++ G4))) =
                          ((c_ i) [i2] ljump_e n));
        [assert (Hle : i2 <= i);
         [subst i G1 i2;
          repeat rewrite app_length;
          crush
         |apply Nat.leb_le in Hle;
          simpl;
          unfold left_jump_n;
          rewrite Hle;
          subst i n G1;
          repeat rewrite app_length];
         rewrite plus_comm with (n:=length G1'), plus_assoc;
         rewrite <- Nat.add_sub_assoc;
         [rewrite Nat.sub_diag, Nat.add_0_r; auto|auto]
        |rewrite Hrewrite3].
      repeat rewrite <- ljump_subst_distr_decl_tys.

      assert (Hunbound_i : [i1 dots i2] runbound_e (c_ i));
        [intros n' Hge Hlt;
         apply ub_var, ub_con, Nat.lt_neq;
         subst i i2 G1;
         rewrite app_length;
         crush|].
      
      eapply H; eauto;
        try solve [simpl in *;
                   subst;
                   auto];
        try solve [apply range_unbound_cons; auto].

      apply range_unbound_subst_components_decl_tys;
        auto;
        eapply range_unbound_ty_str; eauto.
      
      apply range_unbound_subst_components_decl_tys;
        auto;
        eapply range_unbound_ty_str; eauto.

      (*sd upper*)
      apply sd_upper.
      eapply H; eauto;
        try (eapply range_unbound_decl_ty_upper; eauto).

      (*sd lower*)
      apply sd_lower.
      eapply H; eauto;
        try (eapply range_unbound_decl_ty_lower; eauto).

      (*sd equal up*)
      apply sd_eq_up.
      eapply H; eauto;
        try solve [eapply range_unbound_decl_ty_upper; eauto];
        try solve [eapply range_unbound_decl_ty_equal; eauto].

      (*sd equal up*)
      apply sd_eq_lo.
      eapply H; eauto;
        try solve [eapply range_unbound_decl_ty_lower; eauto];
        try solve [eapply range_unbound_decl_ty_equal; eauto].

      (*sd equal*)
      apply sd_equal.
      eapply H; eauto;
        try (eapply range_unbound_decl_ty_equal; eauto).
      eapply H0; eauto;
        try (eapply range_unbound_decl_ty_equal; eauto).

      (*sd value*)
      apply sd_value.
      eapply H; eauto;
        try (eapply range_unbound_decl_ty_value; eauto).
      eapply H0; eauto;
        try (eapply range_unbound_decl_ty_value; eauto).

      (*cons*)
      apply sd_cons.
      eapply H; eauto;
        try (eapply range_unbound_decl_tys_cons; eauto).
      eapply H0; eauto;
        try (eapply range_unbound_decl_tys_cons; eauto).
    Qed.

    Lemma typing_range_unbound_decl_ty :
      (forall Sig G d s, Sig en G vdash d hasType_d s ->
                  forall i1 i2, [i1 dots i2] runbound_d d ->
                           [i1 dots i2] runbound_s s).
    Proof.
      intros.
      inversion H; subst.
      
      apply range_unbound_decl_ty_equal.
      eapply range_unbound_decl_equal; eauto.

      apply range_unbound_decl_ty_value.
      eapply range_unbound_decl_value; eauto.      
    Qed.

    Lemma typing_range_unbound_decl_tys :
      (forall Sig G ds ss, Sig en G vdash ds hasType_ds ss ->
                    forall i1 i2, [i1 dots i2] runbound_ds ds ->
                             [i1 dots i2] runbound_ss ss).
    Proof.
      intros.
      induction H; subst.
      
      apply range_unbound_decl_tys_nil.

      apply range_unbound_decl_tys_cons.
      split;
        [eapply typing_range_unbound_decl_ty;
         eauto
        |eapply IHtyping_ds; eauto];
        eapply range_unbound_decls_cons;
        eauto.
    Qed.
      

    Lemma typing_range_unbound_exp :
      (forall Sig G e t, Sig en G vdash e hasType t ->
                  forall G1 G' G2,
                    G = (G1 ++ G' ++ G2) ->
                    forall i1 i2 n, i1 = length G2 ->
                               i2 = length (G' ++ G2) ->
                               n = length G' ->
                               [i1 dots i2] runbound_e e ->
                               [i1 dots i2] runbound_env G1 ->
                               [i1 dots i2] runbound_env G2 ->
                               [i1 dots i2] runbound_env Sig ->
                               [i1 dots i2] runbound_t t).
    Proof.
      intros Sig G e t Htyp;
        induction Htyp; intros; auto.

      (*var*)
      destruct (unbound_range_var i1 i2 n) as [Htmp1 Htmp2];
        destruct (Htmp1 H4) as [Ha|Ha];
        clear Htmp1 Htmp2.

      subst G.
      unfold mapping in H;
        repeat rewrite rev_app_distr in H.
      rewrite get_app_l in H;
        [
        |subst i1;
         rewrite app_length;
         repeat rewrite rev_length;
         crush].
      rewrite get_app_l in H;
        [apply H6, in_rev, get_in with (n1:=n);
         auto
        |rewrite rev_length;
         subst i1;
         auto].

      subst G.
      unfold mapping in H;
        rewrite rev_app_distr in H.
      rewrite get_app_r in H;
        [apply H5, in_rev, get_in with (n1:=n - length (rev (G' ++ G2)));
         auto
        |subst i2;
         rewrite rev_length;
         auto].

      (*loc*)
      apply H7, in_rev, get_in with (n0:=i); auto.

      (*cast*)
      eapply range_unbound_exp_cast; eauto.

      (*fn*)
      apply range_unbound_ty_arr;
        split;
        eapply range_unbound_exp_fn with (t1:=t1)(t2:=t2);
        eauto.

      (*app*)
      eapply range_unbound_ty_arr;
        eapply IHHtyp1;
        eauto.
      eapply range_unbound_exp_app with (e2:=e');
        eauto.

      (*app path*)
      apply range_unbound_subst_components_type;
        [apply range_unbound_exp_cast;
         split;
         [eapply range_unbound_exp_app;
          eauto
         |eapply range_unbound_ty_arr with (t2:=t2);
          eapply IHHtyp;
          eauto;
          eapply range_unbound_exp_app with (e2:=p);
          eauto]
        |eapply range_unbound_ty_arr;
          eapply IHHtyp;
          eauto;
          eapply range_unbound_exp_app with (e2:=p);
          eauto].

      (*new*)
      apply range_unbound_ty_str.
      apply range_unbound_subst_decl_tys
        with
          (p:=c_ (length G))
          (n:=0).
      eapply typing_range_unbound_decl_tys;
        eauto.
      apply range_unbound_subst_components_decls.
      apply unbound_range_var.
      right;
        subst G;
        rewrite app_length, <- H3;
        crush.
      eapply range_unbound_exp_new;
        eauto.

      (*acc path*)
      apply range_unbound_decl_ty_value with (l:=l).
      eapply has_range_unbound;
        eauto.
      eapply range_unbound_exp_acc;
        eauto.

      (*acc closed*)
      apply range_unbound_decl_ty_value with (l:=l).
      eapply contains_range_unbound;
        eauto.
      eapply IHHtyp;
        eauto.
      eapply range_unbound_exp_acc;
        eauto.
    Qed.

    Lemma closed_ljump_mutind :
      (forall t n i m, closed_t n t <-> closed_t n (t [i] ljump_t m)) /\
    
      (forall s n i m, closed_s n s <-> closed_s n (s [i] ljump_s m)) /\
    
      (forall ss n i m, closed_ss n ss <-> closed_ss n (ss [i] ljump_ss m)) /\
    
      (forall e n i m, closed_e n e <-> closed_e n (e [i] ljump_e m)) /\
    
      (forall d n i m, closed_d n d <-> closed_d n (d [i] ljump_d m)) /\
    
      (forall ds n i m, closed_ds n ds <-> closed_ds n (ds [i] ljump_ds m)).
    Proof.
      apply type_exp_mutind;
        intros;
        try solve [split;
                   simpl;
                   auto];
        try solve [split; intros Hcl;
                   [try (apply cl_str);
                    try (apply cl_sel);
                    try (apply cl_arr);
                    try (apply cls_upper);
                    try (apply cls_lower);
                    try (apply cls_equal);
                    try (apply cls_value);
                    try (apply cls_cons);
                    try (apply cl_acc);
                    try (apply cl_app);
                    try (apply cl_fn);
                    try (apply cl_cast);
                    try (apply cl_new);
                    try (apply cld_equal);
                    try (apply cld_value);
                    try (apply cld_con);
                    try apply H;
                    try apply H0;
                    try apply H1;
                    inversion Hcl;
                    auto
                      
                   |try (apply cl_str);
                    try (apply cl_sel);
                    try (apply cl_arr);
                    try (apply cls_upper);
                    try (apply cls_lower);
                    try (apply cls_equal);
                    try (apply cls_value);
                    try (apply cls_cons);
                    try (apply cl_acc);
                    try (apply cl_app);
                    try (apply cl_fn);
                    try (apply cl_cast);
                    try (apply cl_new);
                    try (apply cld_equal);
                    try (apply cld_value);
                    try (apply cld_con);
                    inversion Hcl;
                    try apply <- H; eauto;
                    try apply <- H0; eauto;
                    try apply <- H1; eauto;
                    auto]].

      (*var*)
      split;
        destruct v as [x|x];
        simpl;
        auto.
    Qed.

    Lemma closed_ljump_type :
      (forall t n i m, closed_t n t <-> closed_t n (t [i] ljump_t m)).
    Proof.
      destruct closed_ljump_mutind; crush.
    Qed.

    Lemma closed_ljump_decl_ty :
      (forall s n i m, closed_s n s <-> closed_s n (s [i] ljump_s m)).
    Proof.
      destruct closed_ljump_mutind; crush.
    Qed.

    Lemma closed_ljump_decl_tys :
      (forall ss n i m, closed_ss n ss <-> closed_ss n (ss [i] ljump_ss m)).
    Proof.
      destruct closed_ljump_mutind; crush.
    Qed.

    Lemma closed_ljump_exp :
      (forall e n i m, closed_e n e <-> closed_e n (e [i] ljump_e m)).
    Proof.
      destruct closed_ljump_mutind; crush.
    Qed.

    Lemma closed_ljump_decl :
      (forall d n i m, closed_d n d <-> closed_d n (d [i] ljump_d m)).
    Proof.
      destruct closed_ljump_mutind; crush.
    Qed.

    Lemma closed_ljump_decls :
      (forall ds n i m, closed_ds n ds <-> closed_ds n (ds [i] ljump_ds m)).
    Proof.
      destruct closed_ljump_mutind; crush.
    Qed.

    Lemma minus_ge_eq :
      forall n m p, n - p = m - p ->
               n >= p ->
               m >= p ->
               n = m.
    Proof.
      intro n;
        induction n as [|n'];
        intros;
        [crush|].

      destruct m as [|m'].
      
      destruct p;
        [crush|crush].
      
      destruct p as [|p'];
        [simpl in H; auto|].
      simpl in H.
      apply IHn' in H; crush.
    Qed.

    Lemma minus_ge_lt :
      forall n m p, n < m ->
               n >= p ->
               m >= p ->
               n - p < m - p.
    Proof.
      intro n;
        induction n as [|n'];
        intros;
        [crush|].

      destruct m as [|m'].

      inversion H.
      
      destruct p as [|p'];
        [simpl in H; auto|].
      assert (Hlt1 : n' < m');
        [crush|].
      apply IHn' with (p:=p') in Hlt1;
        crush.
    Qed.

    Lemma ljump_range_unbound_mutind :
      (forall t i1 i2, [i1 dots i2] runbound_t t ->
                  i1 <= i2 ->
                  forall n, n >= i2 ->
                       n unbound_t t ->
                       (n [i2] ljump_n (i2 - i1)) unbound_t (t [i2] ljump_t (i2 - i1))) /\
    
      (forall s i1 i2, [i1 dots i2] runbound_s s ->
                  i1 <= i2 ->
                  forall n, n >= i2 ->
                       n unbound_s s ->
                       (n [i2] ljump_n (i2 - i1)) unbound_s (s [i2] ljump_s (i2 - i1))) /\
    
      (forall ss i1 i2, [i1 dots i2] runbound_ss ss ->
                   i1 <= i2 ->
                   forall n, n >= i2 ->
                        n unbound_ss ss ->
                        (n [i2] ljump_n (i2 - i1)) unbound_ss (ss [i2] ljump_ss (i2 - i1))) /\
      
      (forall e i1 i2, [i1 dots i2] runbound_e e ->
                  i1 <= i2 ->
                  forall n, n >= i2 ->
                       n unbound_e e ->
                       (n [i2] ljump_n (i2 - i1)) unbound_e (e [i2] ljump_e (i2 - i1))) /\
      
      (forall d i1 i2, [i1 dots i2] runbound_d d ->
                  i1 <= i2 ->
                  forall n, n >= i2 ->
                       n unbound_d d ->
                       (n [i2] ljump_n (i2 - i1)) unbound_d (d [i2] ljump_d (i2 - i1))) /\
      
      (forall ds i1 i2, [i1 dots i2] runbound_ds ds ->
                   i1 <= i2 ->
                   forall n, n >= i2 ->
                        n unbound_ds ds ->
                        (n [i2] ljump_n (i2 - i1)) unbound_ds (ds [i2] ljump_ds (i2 - i1))).
    Proof.
      apply type_exp_mutind; intros; auto;
        try solve [try (apply ub_str);
                   try (apply ub_sel);
                   try (apply ub_new);
                   try (apply ub_acc);
                   try (apply ubs_upper);
                   try (apply ubs_lower);
                   try (apply ubs_equal);
                   try (apply ubs_value);
                   try (apply ubd_equal);
                   try (apply H);
                   auto;
                   
                   [try solve [eapply range_unbound_ty_str; eauto];
                    try solve [eapply range_unbound_ty_sel; eauto];
                    try solve [eapply range_unbound_exp_new; eauto];
                    try solve [eapply range_unbound_exp_acc; eauto];
                    try solve [eapply range_unbound_decl_ty_upper; eauto];
                    try solve [eapply range_unbound_decl_ty_lower; eauto];
                    try solve [eapply range_unbound_decl_ty_equal; eauto];
                    try solve [eapply range_unbound_decl_ty_value; eauto];
                    try solve [eapply range_unbound_decl_equal; eauto]
                   |try (inversion H3);
                    auto]];
        
        try solve [try apply ub_arr;
                   try apply ub_app;
                   try apply ub_cast;
                   try apply ubd_con;
                   try apply ubd_value;
                   try apply ubs_con;
                   [apply H
                   |apply H0];
                   auto;
                   try solve [eapply range_unbound_ty_arr with (t2:=t0); eauto];
                   try solve [eapply range_unbound_exp_app with (e2:=e0); eauto];
                   try solve [eapply range_unbound_exp_cast; eauto];
                   try solve [eapply range_unbound_decls_cons; eauto];
                   try solve [eapply range_unbound_decl_tys_cons; eauto];
                   try solve [eapply range_unbound_decl_value; eauto];
                   try solve [inversion H4; auto]];
        try solve [simpl; auto].

      (*fn*)
      apply ub_fn;
        [apply H
        |apply H0
        |apply H1];
        auto;
        try solve [eapply range_unbound_exp_fn with (t2:=t0); eauto];
        inversion H5; auto.

      (*var*)
      destruct v as [x|x];
        simpl; auto.
      apply ub_var, ub_con;
        intro Hcontra.
      unfold left_jump_n in Hcontra.
      destruct (le_dec i2 n) as [Hle1|Hle1];
        assert (Hleb1 := Hle1);
        [apply Nat.leb_le in Hleb1
        |crush];
        rewrite Hleb1 in Hcontra;
        destruct (le_dec i2 x) as [Hle2|Hle2];
        assert (Hleb2 := Hle2);
        [apply Nat.leb_le in Hleb2
        |apply Nat.leb_nle in Hleb2];
        rewrite Hleb2 in Hcontra.
      apply minus_ge_eq in Hcontra;
        [subst x;
         inversion H2;
         subst
        |crush
        |crush].
      inversion H5; crush.

      assert (Hlt : x < i2);
        [crush|].
      assert (Hge : x >= i1);
        [crush|].
      apply H in Hge;
        apply Hge in Hlt.
      inversion Hlt;
        subst.
      inversion H5;
        auto.
    Qed.

    Lemma ljump_range_unbound_type :
      (forall t i1 i2, [i1 dots i2] runbound_t t ->
                  i1 <= i2 ->
                  forall n, n >= i2 ->
                       n unbound_t t ->
                       (n [i2] ljump_n (i2 - i1)) unbound_t (t [i2] ljump_t (i2 - i1))).
    Proof.
      destruct ljump_range_unbound_mutind; crush.
    Qed.

    Lemma ljump_range_unbound_decl_ty :    
      (forall s i1 i2, [i1 dots i2] runbound_s s ->
                  i1 <= i2 ->
                  forall n, n >= i2 ->
                       n unbound_s s ->
                       (n [i2] ljump_n (i2 - i1)) unbound_s (s [i2] ljump_s (i2 - i1))).
    Proof.
      destruct ljump_range_unbound_mutind; crush.
    Qed.

    Lemma ljump_range_unbound_decl_tys :    
      (forall ss i1 i2, [i1 dots i2] runbound_ss ss ->
                   i1 <= i2 ->
                   forall n, n >= i2 ->
                        n unbound_ss ss ->
                        (n [i2] ljump_n (i2 - i1)) unbound_ss (ss [i2] ljump_ss (i2 - i1))).
    Proof.
      destruct ljump_range_unbound_mutind; crush.
    Qed.

    Lemma ljump_range_unbound_exp :
      (forall e i1 i2, [i1 dots i2] runbound_e e ->
                  i1 <= i2 ->
                  forall n, n >= i2 ->
                       n unbound_e e ->
                       (n [i2] ljump_n (i2 - i1)) unbound_e (e [i2] ljump_e (i2 - i1))).
    Proof.
      destruct ljump_range_unbound_mutind; crush.
    Qed.

    Lemma ljump_range_unbound_decl :
      (forall d i1 i2, [i1 dots i2] runbound_d d ->
                  i1 <= i2 ->
                  forall n, n >= i2 ->
                       n unbound_d d ->
                       (n [i2] ljump_n (i2 - i1)) unbound_d (d [i2] ljump_d (i2 - i1))).
    Proof.
      destruct ljump_range_unbound_mutind; crush.
    Qed.

    Lemma ljump_range_unbound_decls :
      (forall ds i1 i2, [i1 dots i2] runbound_ds ds ->
                   i1 <= i2 ->
                   forall n, n >= i2 ->
                        n unbound_ds ds ->
                        (n [i2] ljump_n (i2 - i1)) unbound_ds (ds [i2] ljump_ds (i2 - i1))).
    Proof.
      destruct ljump_range_unbound_mutind; crush.
    Qed.

    Lemma typing_strengthening_mutind :
      (forall Sig G e t, Sig en G vdash e hasType t ->
                  forall G1 G' G2,
                    G = (G1 ++ G' ++ G2) ->
                    forall i1 i2 n, i1 = length G2 ->
                               i2 = length (G' ++ G2) ->
                               n = length G' ->
                               [i1 dots i2] runbound_e e ->
                               [i1 dots i2] runbound_t t ->
                               [i1 dots i2] runbound_env G1 ->
                               [i1 dots i2] runbound_env G2 ->
                               [i1 dots i2] runbound_env Sig ->
                               (Sig [i2] ljump_env n) en (G1 [i2] ljump_env n) ++ (G2 [i2] ljump_env n) vdash
                                            (e [i2] ljump_e n) hasType (t [i2] ljump_t n)) /\
    
      (forall Sig G d s, Sig en G vdash d hasType_d s ->
                  forall G1 G' G2,
                    G = (G1 ++ G' ++ G2) ->
                    forall i1 i2 n, i1 = length G2 ->
                               i2 = length (G' ++ G2) ->
                               n = length G' ->
                               [i1 dots i2] runbound_d d ->
                               [i1 dots i2] runbound_s s ->
                               [i1 dots i2] runbound_env G1 ->
                               [i1 dots i2] runbound_env G2 ->
                               [i1 dots i2] runbound_env Sig ->
                               (Sig [i2] ljump_env n) en (G1 [i2] ljump_env n) ++ (G2 [i2] ljump_env n) vdash
                                            (d [i2] ljump_d n) hasType_d (s [i2] ljump_s n)) /\
    
      (forall Sig G ds ss, Sig en G vdash ds hasType_ds ss ->
                  forall G1 G' G2,
                    G = (G1 ++ G' ++ G2) ->
                    forall i1 i2 n, i1 = length G2 ->
                               i2 = length (G' ++ G2) ->
                               n = length G' ->
                               [i1 dots i2] runbound_ds ds ->
                               [i1 dots i2] runbound_ss ss ->
                               [i1 dots i2] runbound_env G1 ->
                               [i1 dots i2] runbound_env G2 ->
                               [i1 dots i2] runbound_env Sig ->
                               (Sig [i2] ljump_env n) en (G1 [i2] ljump_env n) ++ (G2 [i2] ljump_env n) vdash
                                            (ds [i2] ljump_ds n) hasType_ds (ss [i2] ljump_ss n)).
    Proof.
      apply typing_mutind; intros; auto.

      (*var*)
      apply unbound_range_var in H3.
      simpl.
      apply t_var.
      rewrite <- ljump_app.
      eapply mapping_strengthening; eauto.

      (*loc*)
      simpl; apply t_loc.
      apply ljump_mapping;
        auto.

      (*cast*)
      assert (Hunbound_t' : [i1 dots i2] runbound_t t');
        [eapply typing_range_unbound_exp;
         eauto;
         eapply range_unbound_exp_cast;
         eauto|].
      simpl;
        apply t_cast
          with (t':=t'[i2] ljump_t n).
      eapply H;
        eauto;
        eapply range_unbound_exp_cast;
        eauto.
      eapply subtyping_strengthening_mutind;
        eauto.

      (*fn*)
      assert (Hunboundt1 : [i1 dots i2] runbound_t t1);
        [eapply range_unbound_ty_arr with (t2:=t2);
         eauto|].
      assert (Hunboundt2 : [i1 dots i2] runbound_t t2);
        [eapply range_unbound_ty_arr;
         eauto|].
      assert (Hunbounde : [i1 dots i2] runbound_e e);
        [eapply range_unbound_exp_fn;
         eauto|].

      simpl; apply t_fn.
      assert (Hrewrite1 : (c_ (length G1 + length G2)) =
                          ((c_ (length G)) [i2] ljump_e n));
        [simpl;
         subst G;
         rewrite app_length;
         assert (Hle : (length G1 + length (G' ++ G2) >= i2));
         [rewrite <- H2; crush
         |apply Nat.leb_le in Hle;
          unfold left_jump_n;
          rewrite Hle];
         rewrite app_length, (plus_comm) with (n:=length G'), plus_assoc, <- H3;
         rewrite <- Nat.add_sub_assoc, Nat.sub_diag, Nat.add_0_r; auto
        |rewrite app_length;
         repeat rewrite ljump_length;
         rewrite Hrewrite1].
      rewrite <- ljump_subst_distr_type.
      rewrite <- ljump_subst_distr_exp.
      assert (Hrewrite2 : ((t1 [i2]ljump_t n) :: (G1 [i2]ljump_env n) ++ (G2 [i2]ljump_env n)) =
                          ((t1 :: G1) [i2]ljump_env n) ++ (G2 [i2]ljump_env n));
        [simpl; auto
        |rewrite Hrewrite2].
      assert (Hunbound_G : [i1 dots i2] runbound_e (c_ (length G)));
        [apply unbound_range_var;
         right;
         subst G;
         rewrite app_length, <- H2;
         crush|].
      eapply H;
        eauto;
        try solve [subst G; simpl; auto];
        try solve [try eapply range_unbound_subst_components_exp;
                   try eapply range_unbound_subst_components_type;
                   eauto];
        try solve [apply range_unbound_cons;
                   auto].

      (*app*)
      assert (Hunbound_e : [i1 dots i2] runbound_e e);
        [eapply range_unbound_exp_app with (e2:=e');
         eauto|].
      assert (Hunbound_e' : [i1 dots i2] runbound_e e');
        [eapply range_unbound_exp_app with (e2:=e');
         eauto|].
      assert (Hunbound_arr : [i1 dots i2] runbound_t (t1 arr t2));
        [eapply typing_range_unbound_exp;
         eauto|].
      assert (Hunbound_t1 : [i1 dots i2] runbound_t t1);
        [eapply range_unbound_ty_arr with (t2:=t2);
         eauto|].
      assert (Hunbound_t2 : [i1 dots i2] runbound_t t2);
        [eapply range_unbound_ty_arr;
         eauto|].
      assert (Hunbound_t' : [i1 dots i2] runbound_t t');
        [eapply typing_range_unbound_exp;
         eauto|].
      
      simpl;
        apply t_app
          with (t1:=t1 [i2] ljump_t n)
               (t':=t' [i2] ljump_t n).

      eapply H; eauto.

      eapply H0; eauto.

      eapply subtyping_strengthening_mutind;
        eauto.
      
      intros.
      apply closed_ljump_type in H10.
      apply c in H10.
      apply closed_ljump_type; auto.

      (*app path*)
      assert (Hunbound_e : [i1 dots i2] runbound_e e);
        [eapply range_unbound_exp_app with (e2:=p);
         eauto|].
      assert (Hunbound_p : [i1 dots i2] runbound_e p);
        [eapply range_unbound_exp_app;
         eauto|].
      assert (Hunbound_arr : [i1 dots i2] runbound_t (t1 arr t2));
        [eapply typing_range_unbound_exp;
         eauto|].
      assert (Hunbound_t1 : [i1 dots i2] runbound_t t1);
        [eapply range_unbound_ty_arr with (t2:=t2);
         eauto|].
      assert (Hunbound_t2 : [i1 dots i2] runbound_t t2);
        [eapply range_unbound_ty_arr;
         eauto|].
      assert (Hunbound_t' : [i1 dots i2] runbound_t t');
        [eapply typing_p_range_unbound;
         eauto|].

      rewrite ljump_subst_distr_type;
        simpl.

      apply t_app_path
        with (t':=t' [i2] ljump_t n).

      eapply H;
        eauto.

      eapply typing_p_strengthening;
        eauto.

      eapply subtyping_strengthening_mutind;
        eauto.

      (*new*)
      assert (Hunbound_ds : [i1 dots i2] runbound_ds ds);
        [eapply range_unbound_exp_new;
         eauto|].
      assert (Hunbound_G : [i1 dots i2] runbound_e (c_ (length G)));
        [apply unbound_range_var;
         right;
         subst G;
         rewrite app_length, <- H2;
         crush|].
      assert (Hunbound_ds' : [i1 dots i2] runbound_ds ([c_ (length G) /ds 0]ds));
        [eapply range_unbound_subst_components_decls;
         eauto|].
      assert (Hunbound_ss : [i1 dots i2] runbound_ss ([c_ (length G) /ss 0]ss));
        [eapply typing_range_unbound_decl_tys;
         eauto|].

      assert (Hrewrite1 : (c_ (length G1 + length G2)) =
                          ((c_ (length G)) [i2] ljump_e n));
        [simpl;
         subst G;
         rewrite app_length;
         assert (Hle : (length G1 + length (G' ++ G2) >= i2));
         [rewrite <- H2; crush
         |apply Nat.leb_le in Hle;
          unfold left_jump_n;
          rewrite Hle];
         rewrite app_length, (plus_comm) with (n:=length G'), plus_assoc, <- H3;
         rewrite <- Nat.add_sub_assoc, Nat.sub_diag, Nat.add_0_r; auto
        |rewrite <- ljump_length
           with
             (G:=G1)
             (i:=i2)
             (n:=n)
          in Hrewrite1;
         rewrite <- ljump_length
           with
             (G:=G2)
             (i:=i2)
             (n:=n)
           in Hrewrite1].
      assert (Hrewrite2 : ((str (ss [i2]ljump_ss n)) :: (G1 [i2]ljump_env n) ++ (G2 [i2]ljump_env n)) =
                          (((str ss) :: G1) [i2]ljump_env n) ++ (G2 [i2]ljump_env n));
        [simpl; auto
        |].

      
      simpl;
        apply t_new.

      rewrite Hrewrite2.
      rewrite app_length, Hrewrite1.
      rewrite <- ljump_subst_distr_decls, <- ljump_subst_distr_decl_tys.
      eapply H; eauto.

      subst G; simpl; auto.
      apply range_unbound_cons; auto.

      assert (Hrewrite3 : (length ((G1 [i2]ljump_env n) ++ (G2 [i2]ljump_env n))) =
                          ((length G) [i2]ljump_n n));
        [inversion Hrewrite1;
         rewrite app_length; auto
        |rewrite Hrewrite3].
      assert (Hrewrite4 : n = i2 - i1);
        [rewrite H2, H1, app_length;
         rewrite <- Nat.add_sub_assoc;
         auto;
         rewrite Nat.sub_diag, Nat.add_0_r;
         auto
        |rewrite Hrewrite4].
      apply ljump_range_unbound_decl_tys;
        auto;
        try solve [eapply range_unbound_ty_str; eauto].
      subst i1 i2;
        rewrite app_length;
        crush.
      subst G i2;
        rewrite app_length;
        crush.
      
      (*acc path*)
      apply has_strengthening
        with
          (G1:=G1)(G2:=G2)
          (G':=G')(n:=n)
          (i1:=i1)(i2:=i2)          
        in h;
        auto.
      simpl; apply t_acc_path; auto.
      eapply range_unbound_exp_acc; eauto.

      (*acc closed*)
      assert (Hunbound_e : [i1 dots i2] runbound_e e);
        [eapply range_unbound_exp_acc;
         eauto|].
      assert (Hunbound_t' : [i1 dots i2] runbound_t t');
        [eapply typing_range_unbound_exp;
         eauto|].
      
      apply contains_strengthening 
        with
          (G1:=G1)(G2:=G2)
          (G':=G')(n:=n)
          (i1:=i1)(i2:=i2)          
        in c;
        auto.
      simpl; apply t_acc_closed with (t':=t' [i2] ljump_t n);
        auto.
      eapply H; eauto.

      intros.
      
      intros.
      apply closed_ljump_type in H9.
      apply c0 in H9.
      apply closed_ljump_type; auto.

      (*decl equal*)
      simpl; apply td_equal;
        auto.

      (*decl value*)
      assert (Hunbound_e : [i1 dots i2] runbound_e e);
        [eapply range_unbound_decl_value;
         eauto|].
      assert (Hunbound_t : [i1 dots i2] runbound_t t);
        [eapply range_unbound_decl_value;
         eauto|].
      assert (Hunbound_t' : [i1 dots i2] runbound_t t');
        [eapply typing_range_unbound_exp;
         eauto|].
      simpl; apply td_val with (t':=t'[i2] ljump_t n);
        auto.
      
      eapply H; eauto.

      eapply subtyping_strengthening_mutind;
        eauto.

      (*decl cons*)
      assert (Hunbound_d : [i1 dots i2] runbound_d d);
        [eapply range_unbound_decls_cons;
         eauto|].
      assert (Hunbound_ds : [i1 dots i2] runbound_ds ds);
        [eapply range_unbound_decls_cons;
         eauto|].
      assert (Hunbound_s : [i1 dots i2] runbound_s s);
        [eapply typing_range_unbound_decl_ty;
         eauto|].
      assert (Hunbound_ss : [i1 dots i2] runbound_ss ss);
        [eapply typing_range_unbound_decl_tys;
         eauto|].

      simpl; apply td_con;
        eauto.
    Qed.

    Lemma typing_strengthening_exp :
      (forall Sig G e t, Sig en G vdash e hasType t ->
                  forall G1 G' G2,
                    G = (G1 ++ G' ++ G2) ->
                    forall i1 i2 n, i1 = length G2 ->
                               i2 = length (G' ++ G2) ->
                               n = length G' ->
                               [i1 dots i2] runbound_e e ->
                               [i1 dots i2] runbound_t t ->
                               [i1 dots i2] runbound_env G1 ->
                               [i1 dots i2] runbound_env G2 ->
                               [i1 dots i2] runbound_env Sig ->
                               (Sig [i2] ljump_env n) en (G1 [i2] ljump_env n) ++ (G2 [i2] ljump_env n) vdash
                                            (e [i2] ljump_e n) hasType (t [i2] ljump_t n)).
    Proof.
      destruct typing_strengthening_mutind; crush.
    Qed.

    Lemma typing_strengthening_decl :    
      (forall Sig G d s, Sig en G vdash d hasType_d s ->
                  forall G1 G' G2,
                    G = (G1 ++ G' ++ G2) ->
                    forall i1 i2 n, i1 = length G2 ->
                               i2 = length (G' ++ G2) ->
                               n = length G' ->
                               [i1 dots i2] runbound_d d ->
                               [i1 dots i2] runbound_s s ->
                               [i1 dots i2] runbound_env G1 ->
                               [i1 dots i2] runbound_env G2 ->
                               [i1 dots i2] runbound_env Sig ->
                               (Sig [i2] ljump_env n) en (G1 [i2] ljump_env n) ++ (G2 [i2] ljump_env n) vdash
                                            (d [i2] ljump_d n) hasType_d (s [i2] ljump_s n)).
    Proof.
      destruct typing_strengthening_mutind; crush.
    Qed.

    Lemma typing_strengthening_decls :    
      (forall Sig G ds ss, Sig en G vdash ds hasType_ds ss ->
                  forall G1 G' G2,
                    G = (G1 ++ G' ++ G2) ->
                    forall i1 i2 n, i1 = length G2 ->
                               i2 = length (G' ++ G2) ->
                               n = length G' ->
                               [i1 dots i2] runbound_ds ds ->
                               [i1 dots i2] runbound_ss ss ->
                               [i1 dots i2] runbound_env G1 ->
                               [i1 dots i2] runbound_env G2 ->
                               [i1 dots i2] runbound_env Sig ->
                               (Sig [i2] ljump_env n) en (G1 [i2] ljump_env n) ++ (G2 [i2] ljump_env n) vdash
                                            (ds [i2] ljump_ds n) hasType_ds (ss [i2] ljump_ss n)).
    Proof.
      destruct typing_strengthening_mutind; crush.
    Qed.

    Lemma membership_range_unbound :
      (forall Sig G e s, Sig en G vdash e mem s ->
                  forall G1 G' G2,
                    G = (G1 ++ G' ++ G2) ->
                    forall i1 i2 n, i1 = length G2 ->
                               i2 = length (G' ++ G2) ->
                               n = length G' ->
                               [i1 dots i2] runbound_e e ->
                               [i1 dots i2] runbound_env G1 ->
                               [i1 dots i2] runbound_env G2 ->
                               [i1 dots i2] runbound_env Sig ->
                               [i1 dots i2] runbound_s s).
    Proof.
      intros Sig G e s Hmem;
        induction Hmem;
        intros;
        auto.

      (*path*)
      eapply has_range_unbound;
        eauto.

      (*exp*)
      eapply contains_range_unbound;
        eauto.
      eapply typing_range_unbound_exp;
        eauto.
    Qed.
    
    Lemma membership_strengthening :
      (forall Sig G e s, Sig en G vdash e mem s ->
                  forall G1 G' G2,
                    G = (G1 ++ G' ++ G2) ->
                    forall i1 i2 n, i1 = length G2 ->
                               i2 = length (G' ++ G2) ->
                               n = length G' ->
                               [i1 dots i2] runbound_e e ->
                               [i1 dots i2] runbound_s s ->
                               [i1 dots i2] runbound_env G1 ->
                               [i1 dots i2] runbound_env G2 ->
                               [i1 dots i2] runbound_env Sig ->
                               (Sig [i2] ljump_env n) en (G1 [i2] ljump_env n) ++ (G2 [i2] ljump_env n) vdash
                                            (e [i2] ljump_e n) mem (s [i2] ljump_s n)).
    Proof.
      intros Sig G e s Hmem;
        induction Hmem;
        intros;
        auto.

      (*path*)
      apply mem_path; auto.
      eapply has_strengthening;
        eauto.

      (*exp*)
      assert (Hunbound_t : [i1 dots i2] runbound_t t);
        [eapply typing_range_unbound_exp; eauto|].
      apply mem_exp with (t:=t [i2] ljump_t n); auto.
      eapply typing_strengthening_exp; eauto.
      eapply contains_strengthening; eauto.
      apply closed_ljump_decl_ty; auto.
    Qed.
    

    Lemma wf_strengthening_mutind :
      (forall Sig G t, Sig en G vdash t wf_t ->
                forall G1 G' G2,
                  G = (G1 ++ G' ++ G2) ->
                  forall i1 i2 n, i1 = length G2 ->
                             i2 = length (G' ++ G2) ->
                             n = length G' ->
                             [i1 dots i2] runbound_t t ->
                             [i1 dots i2] runbound_env G1 ->
                             [i1 dots i2] runbound_env G2 ->
                             [i1 dots i2] runbound_env Sig ->
                             (Sig [i2] ljump_env n) en (G1 [i2] ljump_env n) ++ (G2 [i2] ljump_env n) vdash (t [i2] ljump_t n) wf_t) /\
      
      (forall Sig G s, Sig en G vdash s wf_s ->
                forall G1 G' G2,
                  G = (G1 ++ G' ++ G2) ->
                  forall i1 i2 n, i1 = length G2 ->
                             i2 = length (G' ++ G2) ->
                             n = length G' ->
                             [i1 dots i2] runbound_s s ->
                             [i1 dots i2] runbound_env G1 ->
                             [i1 dots i2] runbound_env G2 ->
                             [i1 dots i2] runbound_env Sig ->
                             (Sig [i2] ljump_env n) en (G1 [i2] ljump_env n) ++ (G2 [i2] ljump_env n) vdash (s [i2] ljump_s n) wf_s) /\
      
      (forall Sig G ss, Sig en G vdash ss wf_ss ->
                 forall G1 G' G2,
                   G = (G1 ++ G' ++ G2) ->
                   forall i1 i2 n, i1 = length G2 ->
                              i2 = length (G' ++ G2) ->
                              n = length G' ->
                              [i1 dots i2] runbound_ss ss ->
                              [i1 dots i2] runbound_env G1 ->
                              [i1 dots i2] runbound_env G2 ->
                              [i1 dots i2] runbound_env Sig ->
                              (Sig [i2] ljump_env n) en (G1 [i2] ljump_env n) ++ (G2 [i2] ljump_env n) vdash (ss [i2] ljump_ss n) wf_ss) /\
      
      (forall Sig G e, Sig en G vdash e wf_e ->
                forall G1 G' G2,
                  G = (G1 ++ G' ++ G2) ->
                  forall i1 i2 n, i1 = length G2 ->
                             i2 = length (G' ++ G2) ->
                             n = length G' ->
                             [i1 dots i2] runbound_e e ->
                             [i1 dots i2] runbound_env G1 ->
                             [i1 dots i2] runbound_env G2 ->
                             [i1 dots i2] runbound_env Sig ->
                             (Sig [i2] ljump_env n) en (G1 [i2] ljump_env n) ++ (G2 [i2] ljump_env n) vdash (e [i2] ljump_e n) wf_e) /\
      
      (forall Sig G d, Sig en G vdash d wf_d ->
                forall G1 G' G2,
                  G = (G1 ++ G' ++ G2) ->
                  forall i1 i2 n, i1 = length G2 ->
                             i2 = length (G' ++ G2) ->
                             n = length G' ->
                             [i1 dots i2] runbound_d d ->
                             [i1 dots i2] runbound_env G1 ->
                             [i1 dots i2] runbound_env G2 ->
                             [i1 dots i2] runbound_env Sig ->
                             (Sig [i2] ljump_env n) en (G1 [i2] ljump_env n) ++ (G2 [i2] ljump_env n) vdash (d [i2] ljump_d n) wf_d) /\
      
      (forall Sig G ds, Sig en G vdash ds wf_ds ->
                 forall G1 G' G2,
                   G = (G1 ++ G' ++ G2) ->
                   forall i1 i2 n, i1 = length G2 ->
                              i2 = length (G' ++ G2) ->
                              n = length G' ->
                              [i1 dots i2] runbound_ds ds ->
                              [i1 dots i2] runbound_env G1 ->
                              [i1 dots i2] runbound_env G2 ->
                              [i1 dots i2] runbound_env Sig ->
                              (Sig [i2] ljump_env n) en (G1 [i2] ljump_env n) ++ (G2 [i2] ljump_env n) vdash (ds [i2] ljump_ds n) wf_ds).
    Proof.
      apply wf_mutind; intros; auto.

      (*arr*)
      assert (Hunbound_t1 : [i1 dots i2] runbound_t t1);
        [eapply range_unbound_ty_arr with (t2:=t2); eauto|].
      assert (Hunbound_t2 : [i1 dots i2] runbound_t t2);
        [eapply range_unbound_ty_arr with (t2:=t2); eauto|].
      
      assert (Hrewrite1 : (c_ (length G1 + length G2)) =
                          ((c_ (length G)) [i2] ljump_e n));
        [simpl;
         subst G;
         rewrite app_length;
         assert (Hle : (length G1 + length (G' ++ G2) >= i2));
         [rewrite <- H3; crush
         |apply Nat.leb_le in Hle;
          unfold left_jump_n;
          rewrite Hle];
         rewrite app_length, (plus_comm) with (n:=length G'), plus_assoc, <- H4;
         rewrite <- Nat.add_sub_assoc, Nat.sub_diag, Nat.add_0_r; auto
        |rewrite <- ljump_length
           with
             (G:=G1)
             (i:=i2)
             (n:=n)
          in Hrewrite1;
         rewrite <- ljump_length
           with
             (G:=G2)
             (i:=i2)
             (n:=n)
           in Hrewrite1].
      assert (Hrewrite2 : ((t1 [i2]ljump_t n) :: (G1 [i2]ljump_env n) ++ (G2 [i2]ljump_env n)) =
                          ((t1 :: G1) [i2]ljump_env n) ++ (G2 [i2]ljump_env n));
        [simpl; auto
        |].
      
      simpl; apply wf_arr.

      eapply H; eauto.
      assert (Hrewrite3 : (length ((G1 [i2]ljump_env n) ++ (G2 [i2]ljump_env n))) =
                          ((length G) [i2] ljump_n n));
        [inversion Hrewrite1; rewrite app_length; auto
        |rewrite Hrewrite3].
      assert (Hrewrite4 : n = i2 - i1);
        [rewrite H3, H2, app_length;
         rewrite <- Nat.add_sub_assoc;
         auto;
         rewrite Nat.sub_diag, Nat.add_0_r;
         auto
        |rewrite Hrewrite4].
      apply ljump_range_unbound_type;
        auto;
        [subst i1 i2;
         rewrite app_length;
         crush
        |subst G i2;
         rewrite app_length;
         crush].

      rewrite app_length, Hrewrite1, Hrewrite2.
      rewrite <- ljump_subst_distr_type.
      eapply H0; eauto.
      subst G; simpl; auto.
      apply range_unbound_subst_components_type; auto.
      apply unbound_range_var;
        right;
        subst G i2;
        rewrite app_length;
        crush.
      apply range_unbound_cons; auto.

      (*sel upper*)
      assert (Hunbound_p : [i1 dots i2] runbound_e p);
        [eapply range_unbound_ty_sel; eauto|].
      simpl; apply wf_sel_upper with (t:=t [i2] ljump_t n); auto.
      eapply H; eauto.
      apply ljump_is_path; auto.
      apply has_strengthening
        with
          (G1:=G1)(G2:=G2)
          (G':=G')(n:=n)
          (i1:=i1)(i2:=i2)
        in h;
        auto.

      (*sel lower*)
      assert (Hunbound_p : [i1 dots i2] runbound_e p);
        [eapply range_unbound_ty_sel; eauto|].
      simpl; apply wf_sel_lower with (t:=t [i2] ljump_t n); auto.
      eapply H; eauto.
      apply ljump_is_path; auto.
      apply has_strengthening
        with
          (G1:=G1)(G2:=G2)
          (G':=G')(n:=n)
          (i1:=i1)(i2:=i2)
        in h;
        auto.

      (*sel equal*)
      assert (Hunbound_p : [i1 dots i2] runbound_e p);
        [eapply range_unbound_ty_sel; eauto|].
      simpl; apply wf_sel_equal with (t:=t [i2] ljump_t n); auto.
      eapply H; eauto.
      apply ljump_is_path; auto.
      apply has_strengthening
        with
          (G1:=G1)(G2:=G2)
          (G':=G')(n:=n)
          (i1:=i1)(i2:=i2)
        in h;
        auto.
      
      (*str*)
      assert (Hunbound_ss : [i1 dots i2] runbound_ss ss);
        [eapply range_unbound_ty_str; eauto|].
      
      assert (Hrewrite1 : (c_ (length G1 + length G2)) =
                          ((c_ (length G)) [i2] ljump_e n));
        [simpl;
         subst G;
         rewrite app_length;
         assert (Hle : (length G1 + length (G' ++ G2) >= i2));
         [rewrite <- H2; crush
         |apply Nat.leb_le in Hle;
          unfold left_jump_n;
          rewrite Hle];
         rewrite app_length, (plus_comm) with (n:=length G'), plus_assoc, <- H3;
         rewrite <- Nat.add_sub_assoc, Nat.sub_diag, Nat.add_0_r; auto
        |rewrite <- ljump_length
           with
             (G:=G1)
             (i:=i2)
             (n:=n)
          in Hrewrite1;
         rewrite <- ljump_length
           with
             (G:=G2)
             (i:=i2)
             (n:=n)
           in Hrewrite1].
      assert (Hrewrite2 : ((str (ss [i2]ljump_ss n)) :: (G1 [i2]ljump_env n) ++ (G2 [i2]ljump_env n)) =
                          (((str ss) :: G1) [i2]ljump_env n) ++ (G2 [i2]ljump_env n));
        [simpl; auto
        |].
      assert (Hrewrite3 : (length ((G1 [i2]ljump_env n) ++ (G2 [i2]ljump_env n))) =
                          ((length G) [i2] ljump_n n));
        [inversion Hrewrite1; rewrite app_length; auto
        |].
      assert (Hrewrite4 : n = i2 - i1);
        [rewrite H2, H1, app_length;
         rewrite <- Nat.add_sub_assoc;
         auto;
         rewrite Nat.sub_diag, Nat.add_0_r;
         auto
        |].

      simpl; apply wf_str.

      rewrite Hrewrite3, Hrewrite4.
      apply ljump_range_unbound_decl_tys;
      auto.
      subst i1 i2;
        rewrite app_length;
        crush.
      subst G i2;
        rewrite app_length;
        crush.

      rewrite app_length, Hrewrite1, Hrewrite2, <- ljump_subst_distr_decl_tys.
      eapply H; eauto.
      subst G; simpl; auto.
      apply range_unbound_subst_components_decl_tys; auto.
      apply unbound_range_var;
        right;
        subst G i2;
        rewrite app_length;
        crush.
      apply range_unbound_cons;
        auto.

      (*upper*)
      assert (Hunbound_t : [i1 dots i2] runbound_t t);
        [eapply range_unbound_decl_ty_upper;
         eauto
        |].
      simpl; apply wft_upper;
        auto.
      eapply H; eauto.

      (*lower*)
      assert (Hunbound_t : [i1 dots i2] runbound_t t);
        [eapply range_unbound_decl_ty_lower;
         eauto
        |].
      simpl; apply wft_lower;
        auto.
      eapply H; eauto.

      (*equal*)
      assert (Hunbound_t : [i1 dots i2] runbound_t t);
        [eapply range_unbound_decl_ty_equal;
         eauto
        |].
      simpl; apply wft_equal;
        auto.
      eapply H; eauto.

      (*value*)
      assert (Hunbound_t : [i1 dots i2] runbound_t t);
        [eapply range_unbound_decl_ty_value;
         eauto
        |].
      simpl; apply wft_value;
        auto.
      eapply H; eauto.

      (*dt cons*)
      simpl; apply wft_con; auto.

      eapply H; eauto.
      eapply range_unbound_decl_tys_cons; eauto.

      eapply H0; eauto.
      eapply range_unbound_decl_tys_cons; eauto.
      apply not_in_decl_tys_ljump; auto.

      (*var*)
      assert (Hrewrite1 : ((length G1 + length G2)) =
                          ((length G) [i2] ljump_n n0));
        [simpl;
         subst G;
         rewrite app_length;
         assert (Hle : (length G1 + length (G' ++ G2) >= i2));
         [rewrite <- H1; crush
         |apply Nat.leb_le in Hle;
          unfold left_jump_n;
          rewrite Hle];
         rewrite app_length, (plus_comm) with (n:=length G'), plus_assoc, <- H2; 
         rewrite <- Nat.add_sub_assoc, Nat.sub_diag, Nat.add_0_r; auto
        |rewrite <- ljump_length
           with
             (G:=G1)
             (i:=i2)
             (n:=n0)
          in Hrewrite1;
         rewrite <- ljump_length
           with
             (G:=G2)
             (i:=i2)
             (n:=n0)
           in Hrewrite1].

      simpl; apply wf_var.

      rewrite app_length;
        rewrite Hrewrite1.
      unfold left_jump_n.
      assert (Hle1 : i2 <= length G);
        [subst G i2;
         rewrite app_length with (l:=G1);
         crush
        |assert (Hleb1 := Hle1);
         apply Nat.leb_le in Hleb1;
         rewrite Hleb1].
      destruct (le_dec i2 n) as [Hle2|Hle2];
        assert (Hleb2 := Hle2);
        [apply Nat.leb_le in Hleb2
        |apply Nat.leb_nle in Hleb2];
        rewrite Hleb2.
      apply minus_ge_lt;
        auto.
      subst n0 i2;
        rewrite app_length in Hle2;
        crush.
      subst G n0;
        repeat rewrite app_length;
        crush.
      assert (Hle3 : length G - n0 >= i1);
        [subst G n0 i1;
         repeat rewrite app_length;
         crush|].
      destruct (lt_dec n i1) as [Hlt1|Hlt1];
        assert (Hltb1 := Hlt1);
        [apply Nat.ltb_lt in Hltb1; crush
        |apply not_ge in Hle2;
         apply H3 in Hle2;
         [inversion Hle2;
          subst;
          inversion H9;
          crush|crush]].

      (*loc*)
      simpl; apply wf_loc;
        rewrite ljump_length;
        auto.

      (*fn*)
      assert (Hunbound_t1 : [i1 dots i2] runbound_t t1);
        [eapply range_unbound_exp_fn with (t2:=t2); eauto|].
      assert (Hunbound_t2 : [i1 dots i2] runbound_t t2);
        [eapply range_unbound_exp_fn with (t2:=t2); eauto|].
      assert (Hunbound_e : [i1 dots i2] runbound_e e);
        [eapply range_unbound_exp_fn with (t2:=t2); eauto|].
      assert (Hunbound_G : [i1 dots i2]runbound_e (v_ Var (length G)));
        [apply unbound_range_var;
         right;
         subst G;
         rewrite app_length, <- H4;
         crush|].
      
      assert (Hrewrite1 : (c_ (length G1 + length G2)) =
                          ((c_ (length G)) [i2] ljump_e n));
        [simpl;
         subst G;
         rewrite app_length;
         assert (Hle : (length G1 + length (G' ++ G2) >= i2));
         [rewrite <- H4; crush
         |apply Nat.leb_le in Hle;
          unfold left_jump_n;
          rewrite Hle];
         rewrite app_length, (plus_comm) with (n:=length G'), plus_assoc, <- H5;
         rewrite <- Nat.add_sub_assoc, Nat.sub_diag, Nat.add_0_r; auto
        |rewrite <- ljump_length
           with
             (G:=G1)
             (i:=i2)
             (n:=n)
          in Hrewrite1;
         rewrite <- ljump_length
           with
             (G:=G2)
             (i:=i2)
             (n:=n)
           in Hrewrite1].
      assert (Hrewrite2 : ((t1 [i2]ljump_t n) :: (G1 [i2]ljump_env n) ++ (G2 [i2]ljump_env n)) =
                          ((t1 :: G1) [i2]ljump_env n) ++ (G2 [i2]ljump_env n));
        [simpl; auto
        |].
      
      assert (Hrewrite3 : (length ((G1 [i2]ljump_env n) ++ (G2 [i2]ljump_env n))) =
                          ((length G) [i2] ljump_n n));
        [inversion Hrewrite1; rewrite app_length; auto
        |].
      assert (Hrewrite4 : n = i2 - i1);
        [rewrite H4, H3, app_length;
         rewrite <- Nat.add_sub_assoc;
         auto;
         rewrite Nat.sub_diag, Nat.add_0_r;
         auto
        |].
      

      simpl; apply wf_fn.
      
      eapply H; eauto.

      rewrite Hrewrite3, Hrewrite4.
      apply ljump_range_unbound_exp; auto.
      subst i1 i2;
        rewrite app_length;
        crush.
      subst G i2;
        rewrite app_length;
        crush.

      rewrite app_length, Hrewrite1, Hrewrite2.
      rewrite <- ljump_subst_distr_exp.
      eapply H0; eauto;
        try solve [subst G; simpl; auto];
        try solve [apply range_unbound_subst_components_exp;
                   auto];
        try solve [apply range_unbound_cons;
                   auto].

      rewrite Hrewrite3, Hrewrite4.
      apply ljump_range_unbound_type;
        auto;
        [subst i1 i2;
         rewrite app_length;
         crush
        |subst G i2;
         rewrite app_length;
         crush].

      rewrite app_length, Hrewrite1, Hrewrite2.
      rewrite <- ljump_subst_distr_type.
      eapply H1; eauto;
        try solve [subst G; simpl; auto];
        try solve [apply range_unbound_subst_components_type;
                   auto];
        try solve [apply range_unbound_cons;
                   auto].

      rewrite app_length, Hrewrite1, Hrewrite2.
      rewrite <- ljump_subst_distr_type.
      rewrite <- ljump_subst_distr_exp.
      eapply typing_strengthening_exp;
        eauto;
        try solve [subst G; simpl; auto];
        try solve [apply range_unbound_subst_components_type;
                   auto];
        try solve [apply range_unbound_subst_components_exp;
                   auto];
        try solve [apply range_unbound_cons;
                   auto].

      (*app*)
      assert (Hunbound_e : [i1 dots i2] runbound_e e);
        [eapply range_unbound_exp_app with (e2:=e'); eauto|].
      assert (Hunbound_e' : [i1 dots i2] runbound_e e');
        [eapply range_unbound_exp_app; eauto|].
      assert (Hunbound_arr : [i1 dots i2] runbound_t (t1 arr t2));
        [eapply typing_range_unbound_exp; eauto|].
      assert (Hunbound_t1 : [i1 dots i2] runbound_t t1);
        [eapply range_unbound_ty_arr with (t2:=t2); eauto|].
      assert (Hunbound_t2 : [i1 dots i2] runbound_t t2);
        [eapply range_unbound_ty_arr with (t2:=t2); eauto|].

      simpl; apply wf_app
               with
                 (t1:=t1 [i2] ljump_t n)
                 (t2:=t2 [i2] ljump_t n);
      auto.

      eapply H; eauto.

      eapply H0; eauto.

      eapply typing_strengthening_exp in t;
        eauto.

      eapply typing_strengthening_exp;
        eauto.

      (*acc*)
      assert (Hunbound_e : [i1 dots i2] runbound_e e);
        [eapply range_unbound_exp_acc; eauto|].
      assert (Hunbound_l : [i1 dots i2] runbound_s (val l oft t'));
        [eapply membership_range_unbound; eauto|].
      assert (Hunbound_t' : [i1 dots i2] runbound_t t');
        [eapply range_unbound_decl_ty_value; eauto|].
      
      simpl; apply wf_acc with (t':=t' [i2] ljump_t n); auto.

      eapply H; eauto.

      eapply membership_strengthening in m; eauto.

      (*cast*)
      assert (Hunbound_e : [i1 dots i2] runbound_e e);
        [eapply range_unbound_exp_cast; eauto|].
      assert (Hunbound_t : [i1 dots i2] runbound_t t);
        [eapply range_unbound_exp_cast; eauto|].
      assert (Hunbound_t' : [i1 dots i2] runbound_t t');
        [eapply typing_range_unbound_exp; eauto|].

      simpl; apply wf_cast with (t':=t' [i2] ljump_t n);
        auto.

      eapply H;
        eauto.

      eapply H0;
        eauto.

      eapply typing_strengthening_exp;
        eauto.

      eapply subtyping_strengthening_mutind;
        eauto.

      (*new*)
      assert (Hunbound_ds : [i1 dots i2] runbound_ds ds);
        [eapply range_unbound_exp_new; eauto|].
      assert (Hunbound_str : [i1 dots i2] runbound_t (str ss));
        [eapply typing_range_unbound_exp; eauto|].
      assert (Hunbound_ss : [i1 dots i2] runbound_ss ss);
        [eapply range_unbound_ty_str; eauto|].
      
      assert (Hrewrite1 : (c_ (length G1 + length G2)) =
                          ((c_ (length G)) [i2] ljump_e n));
        [simpl;
         subst G;
         rewrite app_length;
         assert (Hle : (length G1 + length (G' ++ G2) >= i2));
         [rewrite <- H2; crush
         |apply Nat.leb_le in Hle;
          unfold left_jump_n;
          rewrite Hle];
         rewrite app_length, (plus_comm) with (n:=length G'), plus_assoc, <- H3;
         rewrite <- Nat.add_sub_assoc, Nat.sub_diag, Nat.add_0_r; auto
        |rewrite <- ljump_length
           with
             (G:=G1)
             (i:=i2)
             (n:=n)
          in Hrewrite1;
         rewrite <- ljump_length
           with
             (G:=G2)
             (i:=i2)
             (n:=n)
           in Hrewrite1].
      assert (Hrewrite2 : ((str (ss [i2]ljump_ss n)) :: (G1 [i2]ljump_env n) ++ (G2 [i2]ljump_env n)) =
                          (((str ss) :: G1) [i2]ljump_env n) ++ (G2 [i2]ljump_env n));
        [simpl; auto
        |].
      assert (Hrewrite3 : (length ((G1 [i2]ljump_env n) ++ (G2 [i2]ljump_env n))) =
                          ((length G) [i2] ljump_n n));
        [inversion Hrewrite1; rewrite app_length; auto
        |].
      assert (Hrewrite4 : n = i2 - i1);
        [rewrite H2, H1, app_length;
         rewrite <- Nat.add_sub_assoc;
         auto;
         rewrite Nat.sub_diag, Nat.add_0_r;
         auto
        |].

      simpl; apply wf_new with (ss:=ss [i2] ljump_ss n).

      eapply typing_strengthening_exp in t;
        eauto.

      rewrite Hrewrite3, Hrewrite4.
      apply ljump_range_unbound_decls;
      auto.
      subst i1 i2;
        rewrite app_length;
        crush.
      subst G i2;
        rewrite app_length;
        crush.

      rewrite app_length, Hrewrite1, Hrewrite2, <- ljump_subst_distr_decls.
      eapply H; eauto.
      subst G; simpl; auto.
      apply range_unbound_subst_components_decls; auto.
      apply unbound_range_var;
        right;
        subst G i2;
        rewrite app_length;
        crush.
      apply range_unbound_cons;
        auto.

      (*decl equal*)
      simpl; apply wfe_equal; auto.

      eapply H; eauto.

      eapply range_unbound_decl_equal; eauto.

      (*decl value*)
      assert (Hunbound_e : [i1 dots i2] runbound_e e);
        [eapply range_unbound_decl_value; eauto|].
      assert (Hunbound_t : [i1 dots i2] runbound_t t);
        [eapply range_unbound_decl_value; eauto|].
      assert (Hunbound_t' : [i1 dots i2] runbound_t t');
        [eapply typing_range_unbound_exp; eauto|].

      simpl; apply wfe_value with (t':=t' [i2] ljump_t n); auto.

      eapply H; eauto.

      eapply H0; eauto.

      eapply typing_strengthening_exp; eauto.

      eapply subtyping_strengthening_mutind; eauto.

      (*decl cons*)
      assert (Hunbound_d : [i1 dots i2] runbound_d d);
        [eapply range_unbound_decls_cons; eauto|].
      assert (Hunbound_ds : [i1 dots i2] runbound_ds ds);
        [eapply range_unbound_decls_cons; eauto|].

      simpl; apply wfe_con; eauto.
      apply not_in_decls_ljump; auto.
    Qed.

    Lemma wf_has_implies_has :
      forall P, P.