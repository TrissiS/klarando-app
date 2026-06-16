.class public Landroidx/appcompat/widget/AppCompatButton;
.super Landroid/widget/Button;
.source "AppCompatButton.java"

# interfaces
.implements Lb/h/m/x;
.implements Lb/h/n/b;
.implements Lb/h/n/l;


# instance fields
.field public final h:Lb/b/q/d;

.field public final i:Lb/b/q/m;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Landroidx/appcompat/widget/AppCompatButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lb/b/a;->buttonStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroidx/appcompat/widget/AppCompatButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 3
    invoke-static {p1}, Lb/b/q/d0;->b(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p0, p1}, Lb/b/q/b0;->a(Landroid/view/View;Landroid/content/Context;)V

    .line 5
    new-instance p1, Lb/b/q/d;

    invoke-direct {p1, p0}, Lb/b/q/d;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatButton;->h:Lb/b/q/d;

    .line 6
    invoke-virtual {p1, p2, p3}, Lb/b/q/d;->a(Landroid/util/AttributeSet;I)V

    .line 7
    new-instance p1, Lb/b/q/m;

    invoke-direct {p1, p0}, Lb/b/q/m;-><init>(Landroid/widget/TextView;)V

    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

    .line 8
    invoke-virtual {p1, p2, p3}, Lb/b/q/m;->a(Landroid/util/AttributeSet;I)V

    .line 9
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

    invoke-virtual {p1}, Lb/b/q/m;->a()V

    return-void
.end method


# virtual methods
.method public drawableStateChanged()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/widget/Button;->drawableStateChanged()V

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->h:Lb/b/q/d;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0}, Lb/b/q/d;->a()V

    .line 4
    :cond_a
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

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
    invoke-super {p0}, Landroid/widget/Button;->getAutoSizeMaxTextSize()I

    move-result v0

    return v0

    .line 3
    :cond_9
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

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
    invoke-super {p0}, Landroid/widget/Button;->getAutoSizeMinTextSize()I

    move-result v0

    return v0

    .line 3
    :cond_9
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

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
    invoke-super {p0}, Landroid/widget/Button;->getAutoSizeStepGranularity()I

    move-result v0

    return v0

    .line 3
    :cond_9
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

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
    invoke-super {p0}, Landroid/widget/Button;->getAutoSizeTextAvailableSizes()[I

    move-result-object v0

    return-object v0

    .line 3
    :cond_9
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

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
    invoke-super {p0}, Landroid/widget/Button;->getAutoSizeTextType()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_d

    const/4 v1, 0x1

    :cond_d
    return v1

    .line 3
    :cond_e
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

    if-eqz v0, :cond_17

    .line 4
    invoke-virtual {v0}, Lb/b/q/m;->g()I

    move-result v0

    return v0

    :cond_17
    return v1
.end method

.method public getSupportBackgroundTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->h:Lb/b/q/d;

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
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->h:Lb/b/q/d;

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
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

    invoke-virtual {v0}, Lb/b/q/m;->h()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getSupportCompoundDrawablesTintMode()Landroid/graphics/PorterDuff$Mode;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

    invoke-virtual {v0}, Lb/b/q/m;->i()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    return-object v0
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/Button;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    const-class v0, Landroid/widget/Button;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/Button;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    const-class v0, Landroid/widget/Button;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onLayout(ZIIII)V
    .registers 12

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/Button;->onLayout(ZIIII)V

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

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

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/Button;->onTextChanged(Ljava/lang/CharSequence;III)V

    .line 2
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

    if-eqz p1, :cond_16

    sget-boolean p2, Lb/h/n/b;->a:Z

    if-nez p2, :cond_16

    invoke-virtual {p1}, Lb/b/q/m;->j()Z

    move-result p1

    if-eqz p1, :cond_16

    .line 3
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

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
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/Button;->setAutoSizeTextTypeUniformWithConfiguration(IIII)V

    goto :goto_f

    .line 3
    :cond_8
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

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
    invoke-super {p0, p1, p2}, Landroid/widget/Button;->setAutoSizeTextTypeUniformWithPresetSizes([II)V

    goto :goto_f

    .line 3
    :cond_8
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

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
    invoke-super {p0, p1}, Landroid/widget/Button;->setAutoSizeTextTypeWithDefaults(I)V

    goto :goto_f

    .line 3
    :cond_8
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

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
    invoke-super {p0, p1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->h:Lb/b/q/d;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0, p1}, Lb/b/q/d;->b(Landroid/graphics/drawable/Drawable;)V

    :cond_a
    return-void
.end method

.method public setBackgroundResource(I)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->h:Lb/b/q/d;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0, p1}, Lb/b/q/d;->a(I)V

    :cond_a
    return-void
.end method

.method public setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lb/h/n/i;->a(Landroid/widget/TextView;Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode$Callback;

    move-result-object p1

    .line 2
    invoke-super {p0, p1}, Landroid/widget/Button;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    return-void
.end method

.method public setSupportAllCaps(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lb/b/q/m;->a(Z)V

    :cond_7
    return-void
.end method

.method public setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->h:Lb/b/q/d;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lb/b/q/d;->b(Landroid/content/res/ColorStateList;)V

    :cond_7
    return-void
.end method

.method public setSupportBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->h:Lb/b/q/d;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lb/b/q/d;->a(Landroid/graphics/PorterDuff$Mode;)V

    :cond_7
    return-void
.end method

.method public setSupportCompoundDrawablesTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

    invoke-virtual {v0, p1}, Lb/b/q/m;->a(Landroid/content/res/ColorStateList;)V

    .line 2
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

    invoke-virtual {p1}, Lb/b/q/m;->a()V

    return-void
.end method

.method public setSupportCompoundDrawablesTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

    invoke-virtual {v0, p1}, Lb/b/q/m;->a(Landroid/graphics/PorterDuff$Mode;)V

    .line 2
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

    invoke-virtual {p1}, Lb/b/q/m;->a()V

    return-void
.end method

.method public setTextAppearance(Landroid/content/Context;I)V
    .registers 4

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/Button;->setTextAppearance(Landroid/content/Context;I)V

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0, p1, p2}, Lb/b/q/m;->a(Landroid/content/Context;I)V

    :cond_a
    return-void
.end method

.method public setTextSize(IF)V
    .registers 4

    .line 1
    sget-boolean v0, Lb/h/n/b;->a:Z

    if-eqz v0, :cond_8

    .line 2
    invoke-super {p0, p1, p2}, Landroid/widget/Button;->setTextSize(IF)V

    goto :goto_f

    .line 3
    :cond_8
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatButton;->i:Lb/b/q/m;

    if-eqz v0, :cond_f

    .line 4
    invoke-virtual {v0, p1, p2}, Lb/b/q/m;->a(IF)V

    :cond_f
    :goto_f
    return-void
.end method
