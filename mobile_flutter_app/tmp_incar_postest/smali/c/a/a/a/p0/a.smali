.class public Lc/a/a/a/p0/a;
.super Lc/a/a/a/p0/e;
.source "ClearTextEndIconDelegate.java"


# instance fields
.field public final d:Landroid/text/TextWatcher;

.field public final e:Landroid/view/View$OnFocusChangeListener;

.field public final f:Lcom/google/android/material/textfield/TextInputLayout$f;

.field public final g:Lcom/google/android/material/textfield/TextInputLayout$g;

.field public h:Landroid/animation/AnimatorSet;

.field public i:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Lcom/google/android/material/textfield/TextInputLayout;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Lc/a/a/a/p0/e;-><init>(Lcom/google/android/material/textfield/TextInputLayout;)V

    .line 2
    new-instance p1, Lc/a/a/a/p0/a$a;

    invoke-direct {p1, p0}, Lc/a/a/a/p0/a$a;-><init>(Lc/a/a/a/p0/a;)V

    iput-object p1, p0, Lc/a/a/a/p0/a;->d:Landroid/text/TextWatcher;

    .line 3
    new-instance p1, Lc/a/a/a/p0/a$b;

    invoke-direct {p1, p0}, Lc/a/a/a/p0/a$b;-><init>(Lc/a/a/a/p0/a;)V

    iput-object p1, p0, Lc/a/a/a/p0/a;->e:Landroid/view/View$OnFocusChangeListener;

    .line 4
    new-instance p1, Lc/a/a/a/p0/a$c;

    invoke-direct {p1, p0}, Lc/a/a/a/p0/a$c;-><init>(Lc/a/a/a/p0/a;)V

    iput-object p1, p0, Lc/a/a/a/p0/a;->f:Lcom/google/android/material/textfield/TextInputLayout$f;

    .line 5
    new-instance p1, Lc/a/a/a/p0/a$d;

    invoke-direct {p1, p0}, Lc/a/a/a/p0/a$d;-><init>(Lc/a/a/a/p0/a;)V

    iput-object p1, p0, Lc/a/a/a/p0/a;->g:Lcom/google/android/material/textfield/TextInputLayout$g;

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/p0/a;)Landroid/view/View$OnFocusChangeListener;
    .registers 1

    .line 3
    iget-object p0, p0, Lc/a/a/a/p0/a;->e:Landroid/view/View$OnFocusChangeListener;

    return-object p0
.end method

.method public static synthetic a(Lc/a/a/a/p0/a;Z)V
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Lc/a/a/a/p0/a;->b(Z)V

    return-void
.end method

.method public static synthetic a(Landroid/text/Editable;)Z
    .registers 1

    .line 1
    invoke-static {p0}, Lc/a/a/a/p0/a;->b(Landroid/text/Editable;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lc/a/a/a/p0/a;)Landroid/text/TextWatcher;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/p0/a;->d:Landroid/text/TextWatcher;

    return-object p0
.end method

.method public static b(Landroid/text/Editable;)Z
    .registers 1

    .line 10
    invoke-interface {p0}, Landroid/text/Editable;->length()I

    move-result p0

    if-lez p0, :cond_8

    const/4 p0, 0x1

    goto :goto_9

    :cond_8
    const/4 p0, 0x0

    :goto_9
    return p0
.end method


# virtual methods
.method public final varargs a([F)Landroid/animation/ValueAnimator;
    .registers 4

    .line 16
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    .line 17
    sget-object v0, Lc/a/a/a/m/a;->a:Landroid/animation/TimeInterpolator;

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    const-wide/16 v0, 0x64

    .line 18
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 19
    new-instance v0, Lc/a/a/a/p0/a$h;

    invoke-direct {v0, p0}, Lc/a/a/a/p0/a$h;-><init>(Lc/a/a/a/p0/a;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-object p1
.end method

.method public a()V
    .registers 4

    .line 4
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, p0, Lc/a/a/a/p0/e;->b:Landroid/content/Context;

    sget v2, Lc/a/a/a/e;->mtrl_ic_cancel:I

    .line 5
    invoke-static {v1, v2}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 6
    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 7
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    .line 8
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lc/a/a/a/j;->clear_text_end_icon_content_description:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconContentDescription(Ljava/lang/CharSequence;)V

    .line 10
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    new-instance v1, Lc/a/a/a/p0/a$e;

    invoke-direct {v1, p0}, Lc/a/a/a/p0/a$e;-><init>(Lc/a/a/a/p0/a;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 11
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, p0, Lc/a/a/a/p0/a;->f:Lcom/google/android/material/textfield/TextInputLayout$f;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Lcom/google/android/material/textfield/TextInputLayout$f;)V

    .line 12
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, p0, Lc/a/a/a/p0/a;->g:Lcom/google/android/material/textfield/TextInputLayout$g;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->a(Lcom/google/android/material/textfield/TextInputLayout$g;)V

    .line 13
    invoke-virtual {p0}, Lc/a/a/a/p0/a;->d()V

    return-void
.end method

.method public a(Z)V
    .registers 3

    .line 14
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->getSuffixText()Ljava/lang/CharSequence;

    move-result-object v0

    if-nez v0, :cond_9

    return-void

    .line 15
    :cond_9
    invoke-virtual {p0, p1}, Lc/a/a/a/p0/a;->b(Z)V

    return-void
.end method

.method public final b(Z)V
    .registers 4

    .line 2
    iget-object v0, p0, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->q()Z

    move-result v0

    if-ne v0, p1, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    if-eqz p1, :cond_27

    .line 3
    iget-object v1, p0, Lc/a/a/a/p0/a;->h:Landroid/animation/AnimatorSet;

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v1

    if-nez v1, :cond_27

    .line 4
    iget-object p1, p0, Lc/a/a/a/p0/a;->i:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 5
    iget-object p1, p0, Lc/a/a/a/p0/a;->h:Landroid/animation/AnimatorSet;

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    if-eqz v0, :cond_3a

    .line 6
    iget-object p1, p0, Lc/a/a/a/p0/a;->h:Landroid/animation/AnimatorSet;

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->end()V

    goto :goto_3a

    :cond_27
    if-nez p1, :cond_3a

    .line 7
    iget-object p1, p0, Lc/a/a/a/p0/a;->h:Landroid/animation/AnimatorSet;

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->cancel()V

    .line 8
    iget-object p1, p0, Lc/a/a/a/p0/a;->i:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    if-eqz v0, :cond_3a

    .line 9
    iget-object p1, p0, Lc/a/a/a/p0/a;->i:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->end()V

    :cond_3a
    :goto_3a
    return-void
.end method

.method public final c()Landroid/animation/ValueAnimator;
    .registers 4

    const/4 v0, 0x2

    new-array v0, v0, [F

    .line 1
    fill-array-data v0, :array_1e

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 2
    sget-object v1, Lc/a/a/a/m/a;->d:Landroid/animation/TimeInterpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    const-wide/16 v1, 0x96

    .line 3
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 4
    new-instance v1, Lc/a/a/a/p0/a$i;

    invoke-direct {v1, p0}, Lc/a/a/a/p0/a$i;-><init>(Lc/a/a/a/p0/a;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-object v0

    nop

    :array_1e
    .array-data 4
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final d()V
    .registers 7

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/p0/a;->c()Landroid/animation/ValueAnimator;

    move-result-object v0

    const/4 v1, 0x2

    new-array v2, v1, [F

    .line 2
    fill-array-data v2, :array_3e

    invoke-virtual {p0, v2}, Lc/a/a/a/p0/a;->a([F)Landroid/animation/ValueAnimator;

    move-result-object v2

    .line 3
    new-instance v3, Landroid/animation/AnimatorSet;

    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v3, p0, Lc/a/a/a/p0/a;->h:Landroid/animation/AnimatorSet;

    new-array v4, v1, [Landroid/animation/Animator;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v2, v4, v0

    .line 4
    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 5
    iget-object v0, p0, Lc/a/a/a/p0/a;->h:Landroid/animation/AnimatorSet;

    new-instance v2, Lc/a/a/a/p0/a$f;

    invoke-direct {v2, p0}, Lc/a/a/a/p0/a$f;-><init>(Lc/a/a/a/p0/a;)V

    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    new-array v0, v1, [F

    .line 6
    fill-array-data v0, :array_46

    invoke-virtual {p0, v0}, Lc/a/a/a/p0/a;->a([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/p0/a;->i:Landroid/animation/ValueAnimator;

    .line 7
    new-instance v1, Lc/a/a/a/p0/a$g;

    invoke-direct {v1, p0}, Lc/a/a/a/p0/a$g;-><init>(Lc/a/a/a/p0/a;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    return-void

    :array_3e
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_46
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method
