.class public Landroidx/appcompat/widget/AppCompatTextView;
.super Landroid/widget/TextView;
.source "AppCompatTextView.java"

# interfaces
.implements Lb/h/m/x;
.implements Lb/h/n/l;
.implements Lb/h/n/b;


# instance fields
.field public final h:Lb/b/q/d;

.field public final i:Lb/b/q/m;

.field public final j:Lb/b/q/l;

.field public k:Z

.field public l:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "Lb/h/k/c;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const v0, 0x1010084

    .line 2
    invoke-direct {p0, p1, p2, v0}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 3
    invoke-static {p1}, Lb/b/q/d0;->b(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Landroidx/appcompat/widget/AppCompatTextView;->k:Z

    .line 5
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p0, p1}, Lb/b/q/b0;->a(Landroid/view/View;Landroid/content/Context;)V

    .line 6
    new-instance p1, Lb/b/q/d;

    invoke-direct {p1, p0}, Lb/b/q/d;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatTextView;->h:Lb/b/q/d;

    .line 7
    invoke-virtual {p1, p2, p3}, Lb/b/q/d;->a(Landroid/util/AttributeSet;I)V

    .line 8
    new-instance p1, Lb/b/q/m;

    invoke-direct {p1, p0}, Lb/b/q/m;-><init>(Landroid/widget/TextView;)V

    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    .line 9
    invoke-virtual {p1, p2, p3}, Lb/b/q/m;->a(Landroid/util/AttributeSet;I)V

    .line 10
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    invoke-virtual {p1}, Lb/b/q/m;->a()V

    .line 11
    new-instance p1, Lb/b/q/l;

    invoke-direct {p1, p0}, Lb/b/q/l;-><init>(Landroid/widget/TextView;)V

    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatTextView;->j:Lb/b/q/l;

    return-void
.end method


# virtual methods
.method public final d()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->l:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_10

    const/4 v1, 0x0

    .line 2
    :try_start_5
    iput-object v1, p0, Landroidx/appcompat/widget/AppCompatTextView;->l:Ljava/util/concurrent/Future;

    .line 3
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/h/k/c;

    invoke-static {p0, v0}, Lb/h/n/i;->a(Landroid/widget/TextView;Lb/h/k/c;)V
    :try_end_10
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_10} :catch_10
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_5 .. :try_end_10} :catch_10

    :catch_10
    :cond_10
    return-void
.end method

.method public drawableStateChanged()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/widget/TextView;->drawableStateChanged()V

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->h:Lb/b/q/d;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0}, Lb/b/q/d;->a()V

    .line 4
    :cond_a
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz v0, :cond_11

    .line 5
    invoke-virtual {v0}, Lb/b/q/m;->a()V

    :cond_11
    return-void
.end method

.method public getAutoSizeMaxTextSize()I
    .registers 2

    .line 1
    sget-boolean v0, Lb/h/n/b;->a:Z

    if-eqz v0, :cond_9

    .line 2
    invoke-super {p0}, Landroid/widget/TextView;->getAutoSizeMaxTextSize()I

    move-result v0

    return v0

    .line 3
    :cond_9
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz v0, :cond_12

    .line 4
    invoke-virtual {v0}, Lb/b/q/m;->c()I

    move-result v0

    return v0

    :cond_12
    const/4 v0, -0x1

    return v0
.end method

.method public getAutoSizeMinTextSize()I
    .registers 2

    .line 1
    sget-boolean v0, Lb/h/n/b;->a:Z

    if-eqz v0, :cond_9

    .line 2
    invoke-super {p0}, Landroid/widget/TextView;->getAutoSizeMinTextSize()I

    move-result v0

    return v0

    .line 3
    :cond_9
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz v0, :cond_12

    .line 4
    invoke-virtual {v0}, Lb/b/q/m;->d()I

    move-result v0

    return v0

    :cond_12
    const/4 v0, -0x1

    return v0
.end method

.method public getAutoSizeStepGranularity()I
    .registers 2

    .line 1
    sget-boolean v0, Lb/h/n/b;->a:Z

    if-eqz v0, :cond_9

    .line 2
    invoke-super {p0}, Landroid/widget/TextView;->getAutoSizeStepGranularity()I

    move-result v0

    return v0

    .line 3
    :cond_9
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz v0, :cond_12

    .line 4
    invoke-virtual {v0}, Lb/b/q/m;->e()I

    move-result v0

    return v0

    :cond_12
    const/4 v0, -0x1

    return v0
.end method

.method public getAutoSizeTextAvailableSizes()[I
    .registers 2

    .line 1
    sget-boolean v0, Lb/h/n/b;->a:Z

    if-eqz v0, :cond_9

    .line 2
    invoke-super {p0}, Landroid/widget/TextView;->getAutoSizeTextAvailableSizes()[I

    move-result-object v0

    return-object v0

    .line 3
    :cond_9
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz v0, :cond_12

    .line 4
    invoke-virtual {v0}, Lb/b/q/m;->f()[I

    move-result-object v0

    return-object v0

    :cond_12
    const/4 v0, 0x0

    new-array v0, v0, [I

    return-object v0
.end method

.method public getAutoSizeTextType()I
    .registers 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    sget-boolean v0, Lb/h/n/b;->a:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    .line 2
    invoke-super {p0}, Landroid/widget/TextView;->getAutoSizeTextType()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_d

    const/4 v1, 0x1

    :cond_d
    return v1

    .line 3
    :cond_e
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz v0, :cond_17

    .line 4
    invoke-virtual {v0}, Lb/b/q/m;->g()I

    move-result v0

    return v0

    :cond_17
    return v1
.end method

.method public getFirstBaselineToTopHeight()I
    .registers 2

    .line 1
    invoke-static {p0}, Lb/h/n/i;->b(Landroid/widget/TextView;)I

    move-result v0

    return v0
.end method

.method public getLastBaselineToBottomHeight()I
    .registers 2

    .line 1
    invoke-static {p0}, Lb/h/n/i;->c(Landroid/widget/TextView;)I

    move-result v0

    return v0
.end method

.method public getSupportBackgroundTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->h:Lb/b/q/d;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Lb/b/q/d;->b()Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getSupportBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->h:Lb/b/q/d;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Lb/b/q/d;->c()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getSupportCompoundDrawablesTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    invoke-virtual {v0}, Lb/b/q/m;->h()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getSupportCompoundDrawablesTintMode()Landroid/graphics/PorterDuff$Mode;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    invoke-virtual {v0}, Lb/b/q/m;->i()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    return-object v0
.end method

.method public getText()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->d()V

    .line 2
    invoke-super {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getTextClassifier()Landroid/view/textclassifier/TextClassifier;
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-ge v0, v1, :cond_10

    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->j:Lb/b/q/l;

    if-nez v0, :cond_b

    goto :goto_10

    .line 2
    :cond_b
    invoke-virtual {v0}, Lb/b/q/l;->a()Landroid/view/textclassifier/TextClassifier;

    move-result-object v0

    return-object v0

    .line 3
    :cond_10
    :goto_10
    invoke-super {p0}, Landroid/widget/TextView;->getTextClassifier()Landroid/view/textclassifier/TextClassifier;

    move-result-object v0

    return-object v0
.end method

.method public getTextMetricsParamsCompat()Lb/h/k/c$a;
    .registers 2

    .line 1
    invoke-static {p0}, Lb/h/n/i;->f(Landroid/widget/TextView;)Lb/h/k/c$a;

    move-result-object v0

    return-object v0
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .registers 4

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    .line 2
    iget-object v1, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    invoke-virtual {v1, p0, v0, p1}, Lb/b/q/m;->a(Landroid/widget/TextView;Landroid/view/inputmethod/InputConnection;Landroid/view/inputmethod/EditorInfo;)V

    .line 3
    invoke-static {v0, p1, p0}, Lb/b/q/g;->a(Landroid/view/inputmethod/InputConnection;Landroid/view/inputmethod/EditorInfo;Landroid/view/View;)Landroid/view/inputmethod/InputConnection;

    return-object v0
.end method

.method public onLayout(ZIIII)V
    .registers 12

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/TextView;->onLayout(ZIIII)V

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz v0, :cond_f

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    .line 3
    invoke-virtual/range {v0 .. v5}, Lb/b/q/m;->a(ZIIII)V

    :cond_f
    return-void
.end method

.method public onMeasure(II)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->d()V

    .line 2
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onMeasure(II)V

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->onTextChanged(Ljava/lang/CharSequence;III)V

    .line 2
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz p1, :cond_16

    sget-boolean p2, Lb/h/n/b;->a:Z

    if-nez p2, :cond_16

    invoke-virtual {p1}, Lb/b/q/m;->j()Z

    move-result p1

    if-eqz p1, :cond_16

    .line 3
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    invoke-virtual {p1}, Lb/b/q/m;->b()V

    :cond_16
    return-void
.end method

.method public setAutoSizeTextTypeUniformWithConfiguration(IIII)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    sget-boolean v0, Lb/h/n/b;->a:Z

    if-eqz v0, :cond_8

    .line 2
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->setAutoSizeTextTypeUniformWithConfiguration(IIII)V

    goto :goto_f

    .line 3
    :cond_8
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz v0, :cond_f

    .line 4
    invoke-virtual {v0, p1, p2, p3, p4}, Lb/b/q/m;->a(IIII)V

    :cond_f
    :goto_f
    return-void
.end method

.method public setAutoSizeTextTypeUniformWithPresetSizes([II)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    sget-boolean v0, Lb/h/n/b;->a:Z

    if-eqz v0, :cond_8

    .line 2
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setAutoSizeTextTypeUniformWithPresetSizes([II)V

    goto :goto_f

    .line 3
    :cond_8
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz v0, :cond_f

    .line 4
    invoke-virtual {v0, p1, p2}, Lb/b/q/m;->a([II)V

    :cond_f
    :goto_f
    return-void
.end method

.method public setAutoSizeTextTypeWithDefaults(I)V
    .registers 3

    .line 1
    sget-boolean v0, Lb/h/n/b;->a:Z

    if-eqz v0, :cond_8

    .line 2
    invoke-super {p0, p1}, Landroid/widget/TextView;->setAutoSizeTextTypeWithDefaults(I)V

    goto :goto_f

    .line 3
    :cond_8
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz v0, :cond_f

    .line 4
    invoke-virtual {v0, p1}, Lb/b/q/m;->a(I)V

    :cond_f
    :goto_f
    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->h:Lb/b/q/d;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0, p1}, Lb/b/q/d;->b(Landroid/graphics/drawable/Drawable;)V

    :cond_a
    return-void
.end method

.method public setBackgroundResource(I)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->h:Lb/b/q/d;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0, p1}, Lb/b/q/d;->a(I)V

    :cond_a
    return-void
.end method

.method public setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 2
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz p1, :cond_a

    .line 3
    invoke-virtual {p1}, Lb/b/q/m;->k()V

    :cond_a
    return-void
.end method

.method public setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 2
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz p1, :cond_a

    .line 3
    invoke-virtual {p1}, Lb/b/q/m;->k()V

    :cond_a
    return-void
.end method

.method public setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V
    .registers 7

    .line 4
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz p1, :cond_c

    .line 5
    invoke-static {v0, p1}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_d

    :cond_c
    move-object p1, v1

    :goto_d
    if-eqz p2, :cond_14

    .line 6
    invoke-static {v0, p2}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    goto :goto_15

    :cond_14
    move-object p2, v1

    :goto_15
    if-eqz p3, :cond_1c

    .line 7
    invoke-static {v0, p3}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    goto :goto_1d

    :cond_1c
    move-object p3, v1

    :goto_1d
    if-eqz p4, :cond_23

    .line 8
    invoke-static {v0, p4}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 9
    :cond_23
    invoke-virtual {p0, p1, p2, p3, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 10
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz p1, :cond_2d

    .line 11
    invoke-virtual {p1}, Lb/b/q/m;->k()V

    :cond_2d
    return-void
.end method

.method public setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 2
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz p1, :cond_a

    .line 3
    invoke-virtual {p1}, Lb/b/q/m;->k()V

    :cond_a
    return-void
.end method

.method public setCompoundDrawablesWithIntrinsicBounds(IIII)V
    .registers 7

    .line 4
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz p1, :cond_c

    .line 5
    invoke-static {v0, p1}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_d

    :cond_c
    move-object p1, v1

    :goto_d
    if-eqz p2, :cond_14

    .line 6
    invoke-static {v0, p2}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    goto :goto_15

    :cond_14
    move-object p2, v1

    :goto_15
    if-eqz p3, :cond_1c

    .line 7
    invoke-static {v0, p3}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    goto :goto_1d

    :cond_1c
    move-object p3, v1

    :goto_1d
    if-eqz p4, :cond_23

    .line 8
    invoke-static {v0, p4}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 9
    :cond_23
    invoke-virtual {p0, p1, p2, p3, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 10
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz p1, :cond_2d

    .line 11
    invoke-virtual {p1}, Lb/b/q/m;->k()V

    :cond_2d
    return-void
.end method

.method public setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 2
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz p1, :cond_a

    .line 3
    invoke-virtual {p1}, Lb/b/q/m;->k()V

    :cond_a
    return-void
.end method

.method public setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lb/h/n/i;->a(Landroid/widget/TextView;Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode$Callback;

    move-result-object p1

    .line 2
    invoke-super {p0, p1}, Landroid/widget/TextView;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    return-void
.end method

.method public setFirstBaselineToTopHeight(I)V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_a

    .line 2
    invoke-super {p0, p1}, Landroid/widget/TextView;->setFirstBaselineToTopHeight(I)V

    goto :goto_d

    .line 3
    :cond_a
    invoke-static {p0, p1}, Lb/h/n/i;->a(Landroid/widget/TextView;I)V

    :goto_d
    return-void
.end method

.method public setLastBaselineToBottomHeight(I)V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_a

    .line 2
    invoke-super {p0, p1}, Landroid/widget/TextView;->setLastBaselineToBottomHeight(I)V

    goto :goto_d

    .line 3
    :cond_a
    invoke-static {p0, p1}, Lb/h/n/i;->b(Landroid/widget/TextView;I)V

    :goto_d
    return-void
.end method

.method public setLineHeight(I)V
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lb/h/n/i;->c(Landroid/widget/TextView;I)V

    return-void
.end method

.method public setPrecomputedText(Lb/h/k/c;)V
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lb/h/n/i;->a(Landroid/widget/TextView;Lb/h/k/c;)V

    return-void
.end method

.method public setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->h:Lb/b/q/d;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lb/b/q/d;->b(Landroid/content/res/ColorStateList;)V

    :cond_7
    return-void
.end method

.method public setSupportBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->h:Lb/b/q/d;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lb/b/q/d;->a(Landroid/graphics/PorterDuff$Mode;)V

    :cond_7
    return-void
.end method

.method public setSupportCompoundDrawablesTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    invoke-virtual {v0, p1}, Lb/b/q/m;->a(Landroid/content/res/ColorStateList;)V

    .line 2
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    invoke-virtual {p1}, Lb/b/q/m;->a()V

    return-void
.end method

.method public setSupportCompoundDrawablesTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    invoke-virtual {v0, p1}, Lb/b/q/m;->a(Landroid/graphics/PorterDuff$Mode;)V

    .line 2
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    invoke-virtual {p1}, Lb/b/q/m;->a()V

    return-void
.end method

.method public setTextAppearance(Landroid/content/Context;I)V
    .registers 4

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0, p1, p2}, Lb/b/q/m;->a(Landroid/content/Context;I)V

    :cond_a
    return-void
.end method

.method public setTextClassifier(Landroid/view/textclassifier/TextClassifier;)V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-ge v0, v1, :cond_f

    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->j:Lb/b/q/l;

    if-nez v0, :cond_b

    goto :goto_f

    .line 2
    :cond_b
    invoke-virtual {v0, p1}, Lb/b/q/l;->a(Landroid/view/textclassifier/TextClassifier;)V

    return-void

    .line 3
    :cond_f
    :goto_f
    invoke-super {p0, p1}, Landroid/widget/TextView;->setTextClassifier(Landroid/view/textclassifier/TextClassifier;)V

    return-void
.end method

.method public setTextFuture(Ljava/util/concurrent/Future;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future<",
            "Lb/h/k/c;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatTextView;->l:Ljava/util/concurrent/Future;

    if-eqz p1, :cond_7

    .line 2
    invoke-virtual {p0}, Landroid/widget/TextView;->requestLayout()V

    :cond_7
    return-void
.end method

.method public setTextMetricsParamsCompat(Lb/h/k/c$a;)V
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lb/h/n/i;->a(Landroid/widget/TextView;Lb/h/k/c$a;)V

    return-void
.end method

.method public setTextSize(IF)V
    .registers 4

    .line 1
    sget-boolean v0, Lb/h/n/b;->a:Z

    if-eqz v0, :cond_8

    .line 2
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    goto :goto_f

    .line 3
    :cond_8
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->i:Lb/b/q/m;

    if-eqz v0, :cond_f

    .line 4
    invoke-virtual {v0, p1, p2}, Lb/b/q/m;->a(IF)V

    :cond_f
    :goto_f
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;I)V
    .registers 5

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->k:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    if-eqz p1, :cond_12

    if-lez p2, :cond_12

    .line 2
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lb/h/f/d;->a(Landroid/content/Context;Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v0

    :cond_12
    const/4 v1, 0x1

    .line 3
    iput-boolean v1, p0, Landroidx/appcompat/widget/AppCompatTextView;->k:Z

    if-eqz v0, :cond_18

    move-object p1, v0

    :cond_18
    const/4 v0, 0x0

    .line 4
    :try_start_19
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_1f

    .line 5
    iput-boolean v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->k:Z

    return-void

    :catchall_1f
    move-exception p1

    iput-boolean v0, p0, Landroidx/appcompat/widget/AppCompatTextView;->k:Z

    .line 6
    throw p1
.end method
