.class public final Lnet/nyx/widget/view/PasswordEditText;
.super Lnet/nyx/widget/view/RegexEditText;
.source "PasswordEditText.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/view/View$OnFocusChangeListener;
.implements Landroid/text/TextWatcher;


# instance fields
.field public m:Landroid/graphics/drawable/Drawable;

.field public final n:Landroid/graphics/drawable/Drawable;

.field public final o:Landroid/graphics/drawable/Drawable;

.field public p:Landroid/view/View$OnTouchListener;

.field public q:Landroid/view/View$OnFocusChangeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lnet/nyx/widget/view/PasswordEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const v0, 0x101006e

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lnet/nyx/widget/view/PasswordEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6

    .line 3
    invoke-direct {p0, p1, p2, p3}, Lnet/nyx/widget/view/RegexEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    sget p2, Ld/a/d/d;->password_off_ic:I

    invoke-static {p1, p2}, Lb/h/e/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-static {p2}, Lb/h/f/l/a;->i(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lnet/nyx/widget/view/PasswordEditText;->n:Landroid/graphics/drawable/Drawable;

    .line 5
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p3

    iget-object v0, p0, Lnet/nyx/widget/view/PasswordEditText;->n:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p2, v1, v1, p3, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 6
    sget p2, Ld/a/d/d;->password_on_ic:I

    invoke-static {p1, p2}, Lb/h/e/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-static {p1}, Lb/h/f/l/a;->i(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lnet/nyx/widget/view/PasswordEditText;->o:Landroid/graphics/drawable/Drawable;

    .line 7
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p2

    iget-object p3, p0, Lnet/nyx/widget/view/PasswordEditText;->o:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p3

    invoke-virtual {p1, v1, v1, p2, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 8
    iget-object p1, p0, Lnet/nyx/widget/view/PasswordEditText;->n:Landroid/graphics/drawable/Drawable;

    iput-object p1, p0, Lnet/nyx/widget/view/PasswordEditText;->m:Landroid/graphics/drawable/Drawable;

    const/16 p1, 0x80

    .line 9
    invoke-virtual {p0, p1}, Lnet/nyx/widget/view/RegexEditText;->a(I)V

    .line 10
    invoke-virtual {p0}, Lnet/nyx/widget/view/RegexEditText;->getInputRegex()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_4a

    const-string p1, "\\S+"

    .line 11
    invoke-virtual {p0, p1}, Lnet/nyx/widget/view/RegexEditText;->setInputRegex(Ljava/lang/String;)V

    .line 12
    :cond_4a
    invoke-direct {p0, v1}, Lnet/nyx/widget/view/PasswordEditText;->setDrawableVisible(Z)V

    .line 13
    invoke-super {p0, p0}, Landroid/widget/EditText;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 14
    invoke-super {p0, p0}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 15
    invoke-super {p0, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method

.method private setDrawableVisible(Z)V
    .registers 6

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/view/PasswordEditText;->m:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v0

    if-ne v0, p1, :cond_9

    return-void

    .line 2
    :cond_9
    iget-object v0, p0, Lnet/nyx/widget/view/PasswordEditText;->m:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 4
    aget-object v1, v0, v1

    const/4 v2, 0x1

    aget-object v2, v0, v2

    if-eqz p1, :cond_1d

    .line 5
    iget-object p1, p0, Lnet/nyx/widget/view/PasswordEditText;->m:Landroid/graphics/drawable/Drawable;

    goto :goto_1e

    :cond_1d
    const/4 p1, 0x0

    :goto_1e
    const/4 v3, 0x3

    aget-object v0, v0, v3

    .line 6
    invoke-virtual {p0, v1, v2, p1, v0}, Landroid/widget/EditText;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    .line 2
    aget-object v1, v0, v1

    const/4 v2, 0x1

    aget-object v2, v0, v2

    iget-object v3, p0, Lnet/nyx/widget/view/PasswordEditText;->m:Landroid/graphics/drawable/Drawable;

    const/4 v4, 0x3

    aget-object v0, v0, v4

    invoke-virtual {p0, v1, v2, v3, v0}, Landroid/widget/EditText;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 2

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method

.method public onFocusChange(Landroid/view/View;Z)V
    .registers 5

    const/4 v0, 0x0

    if-eqz p2, :cond_18

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    if-eqz v1, :cond_18

    .line 2
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v1

    if-lez v1, :cond_14

    const/4 v0, 0x1

    :cond_14
    invoke-direct {p0, v0}, Lnet/nyx/widget/view/PasswordEditText;->setDrawableVisible(Z)V

    goto :goto_1b

    .line 3
    :cond_18
    invoke-direct {p0, v0}, Lnet/nyx/widget/view/PasswordEditText;->setDrawableVisible(Z)V

    .line 4
    :goto_1b
    iget-object v0, p0, Lnet/nyx/widget/view/PasswordEditText;->q:Landroid/view/View$OnFocusChangeListener;

    if-eqz v0, :cond_22

    .line 5
    invoke-interface {v0, p1, p2}, Landroid/view/View$OnFocusChangeListener;->onFocusChange(Landroid/view/View;Z)V

    :cond_22
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->isFocused()Z

    move-result p2

    if-eqz p2, :cond_12

    .line 2
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-lez p1, :cond_e

    const/4 p1, 0x1

    goto :goto_f

    :cond_e
    const/4 p1, 0x0

    :goto_f
    invoke-direct {p0, p1}, Lnet/nyx/widget/view/PasswordEditText;->setDrawableVisible(Z)V

    :cond_12
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 8

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    .line 2
    invoke-virtual {p0}, Landroid/widget/EditText;->getLayoutDirection()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_2c

    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getWidth()I

    move-result v1

    iget-object v4, p0, Lnet/nyx/widget/view/PasswordEditText;->m:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    sub-int/2addr v1, v4

    invoke-virtual {p0}, Landroid/widget/EditText;->getPaddingEnd()I

    move-result v4

    sub-int/2addr v1, v4

    if-le v0, v1, :cond_42

    .line 4
    invoke-virtual {p0}, Landroid/widget/EditText;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/widget/EditText;->getPaddingEnd()I

    move-result v4

    sub-int/2addr v1, v4

    if-ge v0, v1, :cond_42

    :goto_2a
    const/4 v0, 0x1

    goto :goto_43

    :cond_2c
    if-ne v1, v3, :cond_42

    .line 5
    invoke-virtual {p0}, Landroid/widget/EditText;->getPaddingStart()I

    move-result v1

    if-le v0, v1, :cond_42

    .line 6
    invoke-virtual {p0}, Landroid/widget/EditText;->getPaddingStart()I

    move-result v1

    iget-object v4, p0, Lnet/nyx/widget/view/PasswordEditText;->m:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    add-int/2addr v1, v4

    if-ge v0, v1, :cond_42

    goto :goto_2a

    :cond_42
    const/4 v0, 0x0

    .line 7
    :goto_43
    iget-object v1, p0, Lnet/nyx/widget/view/PasswordEditText;->m:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v1

    if-eqz v1, :cond_8a

    if-eqz v0, :cond_8a

    .line 8
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-ne p1, v3, :cond_89

    .line 9
    iget-object p1, p0, Lnet/nyx/widget/view/PasswordEditText;->m:Landroid/graphics/drawable/Drawable;

    iget-object p2, p0, Lnet/nyx/widget/view/PasswordEditText;->n:Landroid/graphics/drawable/Drawable;

    if-ne p1, p2, :cond_68

    .line 10
    iget-object p1, p0, Lnet/nyx/widget/view/PasswordEditText;->o:Landroid/graphics/drawable/Drawable;

    iput-object p1, p0, Lnet/nyx/widget/view/PasswordEditText;->m:Landroid/graphics/drawable/Drawable;

    .line 11
    invoke-static {}, Landroid/text/method/HideReturnsTransformationMethod;->getInstance()Landroid/text/method/HideReturnsTransformationMethod;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 12
    invoke-virtual {p0}, Lnet/nyx/widget/view/PasswordEditText;->a()V

    goto :goto_78

    .line 13
    :cond_68
    iget-object v0, p0, Lnet/nyx/widget/view/PasswordEditText;->o:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_78

    .line 14
    iput-object p2, p0, Lnet/nyx/widget/view/PasswordEditText;->m:Landroid/graphics/drawable/Drawable;

    .line 15
    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 16
    invoke-virtual {p0}, Lnet/nyx/widget/view/PasswordEditText;->a()V

    .line 17
    :cond_78
    :goto_78
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatEditText;->getText()Landroid/text/Editable;

    move-result-object p1

    if-eqz p1, :cond_89

    .line 18
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    :cond_89
    return v3

    .line 19
    :cond_8a
    iget-object v0, p0, Lnet/nyx/widget/view/PasswordEditText;->p:Landroid/view/View$OnTouchListener;

    if-eqz v0, :cond_95

    invoke-interface {v0, p1, p2}, Landroid/view/View$OnTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_95

    const/4 v2, 0x1

    :cond_95
    return v2
.end method

.method public setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lnet/nyx/widget/view/PasswordEditText;->q:Landroid/view/View$OnFocusChangeListener;

    return-void
.end method

.method public setOnTouchListener(Landroid/view/View$OnTouchListener;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lnet/nyx/widget/view/PasswordEditText;->p:Landroid/view/View$OnTouchListener;

    return-void
.end method
