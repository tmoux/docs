(add-to-list 'default-frame-alist '(font . "Fira Code-14" ))
(set-face-attribute 'default t :font "Fira Code-14")
(set-fontset-font "fontset-default" '(#x2227 . #x2228) "DejaVu sans mono - 14")

(setq coq-symbols-list '(lambda ()
        (mapc (lambda (pair) (push pair prettify-symbols-alist))
            '(("forall". ?∀)
              ("exists". ?∃)
              ("~" . ?¬)
              ("/\\" . ?∧)
              ("\\/" . ?∨)
              ("=>". ?⇒)
              ("->". ?→)
              ("<-" . ?←)
              ("<->" . ?↔)
              ("nat" . ?ℕ)
              ("*" . ?×)
	      ("nil" . ?∅)
	      ("bot" . ?⊥)
	      ("top" . ?⊤)
	      ("decl" . ?σ)
	      ("ty" . ?τ)
	      ("env" . ?Γ)
	      ("Sig" . ?∑)
	      ("mu" . ?μ)
	      ("en" . ?,)
	      ("dot" . ?.)
	      ("bar" . ?|)
	      ("vdash" . ?⊢)
	      ("evdash" . ?⊢) ; needed to avoid ambiguity
	      ("dashv" . ?⊣)
	      ("equiv" . ?≡)
	      ("equiv_d" . ?≡)
	      ("equiv_p" . ?≡)
	      ("equiv_e" . ?≡)
	      ("swap" . ?↔)
	      ("swap_t" . ?↔)
	      ("swap_d" . ?↔)
	      ("swap_p" . ?↔)
	      ("swap_e" . ?↔)
	      ("swap_n" . ?↔)
	      ("rshift_v" . ?⇁)
	      ("rshift_t" . ?⇁)
	      ("rshift_dt" . ?⇁)
	      ("rshift_dts" . ?⇁)
	      ("rshift_p" . ?⇁)
	      ("rshift_e" . ?⇁)
	      ("rshift_d" . ?⇁)
	      ("rshift_ds" . ?⇁)
	      ("lshift_v" . ?↽)
	      ("lshift_t" . ?↽)
	      ("lshift_dt" . ?↽)
	      ("lshift_dts" . ?↽)
	      ("lshift_p" . ?↽)
	      ("lshift_e" . ?↽)
	      ("lshift_d" . ?↽)
	      ("lshift_ds" . ?↽)
	      ("ljump_n" . ?↶)
	      ("ljump_v" . ?↶)
	      ("ljump_t" . ?↶)
	      ("ljump_d" . ?↶)
	      ("ljump_ds" . ?↶)
	      ("ljump_dt" . ?↶)
	      ("ljump_dts" . ?↶)
	      ("ljump_p" . ?↶)
	      ("ljump_e" . ?↶)
	      ("rjump_n" . ?↷)
	      ("rjump_v" . ?↷)
	      ("rjump_t" . ?↷)
	      ("rjump_s" . ?↷)
	      ("rjump_ss" . ?↷)
	      ("rjump_e" . ?↷)
	      ("rjump_d" . ?↷)
	      ("rjump_ds" . ?↷)
	      ("rjump_env" . ?↷)
	      ("ljump_n" . ?↶)
	      ("ljump_v" . ?↶)
	      ("ljump_t" . ?↶)
	      ("ljump_s" . ?↶)
	      ("ljump_ss" . ?↶)
	      ("ljump_e" . ?↶)
	      ("ljump_d" . ?↶)
	      ("ljump_ds" . ?↶)
	      ("ljump_env" . ?↶)
	      ("notin_v" . ?∉)
	      ("notin_t" . ?∉)
	      ("notin_s" . ?∉)
	      ("notin_ss" . ?∉)
	      ("notin_e" . ?∉)
	      ("notin_d" . ?∉)
	      ("notin_ds" . ?∉)
	      ("notin_env" . ?∉)
	      ("unbound_t" . ?∉)
	      ("unbound_s" . ?∉)
	      ("unbound_ss" . ?∉)
	      ("unbound_e" . ?∉)
	      ("unbound_d" . ?∉)
	      ("unbound_ds" . ?∉)
	      ("unbound_v" . ?∉)
	      ("runbound_t" . ?∉)
	      ("runbound_s" . ?∉)
	      ("runbound_ss" . ?∉)
	      ("runbound_e" . ?∉)
	      ("runbound_d" . ?∉)
	      ("runbound_ds" . ?∉)
	      ("runbound_v" . ?∉)
	      ("runbound_env" . ?∉)
	      ("dots" . ?…)
	      ("ni" . ?∋)
	      ("cont" . ?∈)
	      ("hasType" . ?:)
	      ("pathType" . ?:)
	      ("hasType_d" . ?:)
	      ("hasType_ds" . ?:)
	      ("hasType_u" . ?:)
	      ("mem" . ?∋)
	      ("<;" . ?≤)
	      ("<;;" . ?≤)
	      ("<;;;" . ?≤)
              ("arr". ?→)
	      ("sup" . ?≥)
	      ("ext" . ?≤)
	      ("supe" . ?≥)
	      ("exte" . ?≤)
	      ("fn" . ?λ)
	      ("off" . ?:)
	      ("in_exp" . ?.)
	      ("oft" . ?:)
	      ("assgn" . ?=)
	      ("eqe" . ?=)
	      ("eqt" . ?=)
	      ("refines" . ?=)
	      ("/t" . ?/)
	      ("/d" . ?/)
	      ("/ds" . ?/)
	      ("/s" . ?/)
	      ("/ss" . ?/)
	      ("/p" . ?/)
	      ("/e" . ?/)
	      ("/env" . ?/)
	      ("/v" . ?/)
	      ("cast" . ?⊴)
	      ("d_nil" . ?∅)
	      ("dt_nil" . ?∅)
              ("reduce". ?↘)
              ("reduce_d". ?↘)
              ("reduce_ds". ?↘)
	      ("mapsto" . ?↦)
	      ("maps_t" . ?↦)
	      ("maps_s" . ?↦)
	      ("maps_ss" . ?↦)
	      ("maps_e" . ?↦)
	      ("maps_d" . ?↦)
	      ("maps_ds" . ?↦)
	      ("elem" . ?∈)
	      ("raise_n" . ?↑)
	      ("raise_v" . ?↑)
	      ("raise_t" . ?↑)
	      ("raise_s" . ?↑)
	      ("raise_ss" . ?↑)
	      ("raise_e" . ?↑)
	      ("raise_d" . ?↑)
	      ("raise_ds" . ?↑)
	      ("br" . ?{)
	      ("rb" . ?})
	      ("str" . ?{)
	      ("rts" . ?})))))
