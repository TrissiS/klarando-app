.class public final Lc/c/c/c/a;
.super Ljava/lang/Object;
.source "ButtonDrawableBuilder.java"


# instance fields
.field public final a:Landroid/widget/CompoundButton;

.field public b:Landroid/graphics/drawable/Drawable;

.field public c:Landroid/graphics/drawable/Drawable;

.field public d:Landroid/graphics/drawable/Drawable;

.field public e:Landroid/graphics/drawable/Drawable;

.field public f:Landroid/graphics/drawable/Drawable;

.field public g:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/widget/CompoundButton;Landroid/content/res/TypedArray;Lc/c/c/f/a;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lc/c/c/c/a;->a:Landroid/widget/CompoundButton;

    .line 3
    invoke-interface {p3}, Lc/c/c/f/a;->d0()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_1a

    .line 4
    invoke-interface {p3}, Lc/c/c/f/a;->d0()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/a;->b:Landroid/graphics/drawable/Drawable;

    goto :goto_22

    .line 5
    :cond_1a
    iget-object p1, p0, Lc/c/c/c/a;->a:Landroid/widget/CompoundButton;

    invoke-static {p1}, Lb/h/n/c;->a(Landroid/widget/CompoundButton;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/a;->b:Landroid/graphics/drawable/Drawable;

    .line 6
    :goto_22
    invoke-interface {p3}, Lc/c/c/f/a;->C()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_36

    .line 7
    invoke-interface {p3}, Lc/c/c/f/a;->C()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/a;->c:Landroid/graphics/drawable/Drawable;

    .line 8
    :cond_36
    invoke-interface {p3}, Lc/c/c/f/a;->G()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_4a

    .line 9
    invoke-interface {p3}, Lc/c/c/f/a;->G()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/a;->d:Landroid/graphics/drawable/Drawable;

    .line 10
    :cond_4a
    invoke-interface {p3}, Lc/c/c/f/a;->P()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_5e

    .line 11
    invoke-interface {p3}, Lc/c/c/f/a;->P()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/a;->e:Landroid/graphics/drawable/Drawable;

    .line 12
    :cond_5e
    invoke-interface {p3}, Lc/c/c/f/a;->a0()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_72

    .line 13
    invoke-interface {p3}, Lc/c/c/f/a;->a0()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/a;->f:Landroid/graphics/drawable/Drawable;

    .line 14
    :cond_72
    invoke-interface {p3}, Lc/c/c/f/a;->V()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_86

    .line 15
    invoke-interface {p3}, Lc/c/c/f/a;->V()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lc/c/c/c/a;->g:Landroid/graphics/drawable/Drawable;

    :cond_86
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/drawable/Drawable;)Lc/c/c/c/a;
    .registers 4

    .line 1
    iget-object v0, p0, Lc/c/c/c/a;->c:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lc/c/c/c/a;->b:Landroid/graphics/drawable/Drawable;

    if-ne v0, v1, :cond_8

    .line 2
    iput-object p1, p0, Lc/c/c/c/a;->c:Landroid/graphics/drawable/Drawable;

    .line 3
    :cond_8
    iget-object v0, p0, Lc/c/c/c/a;->d:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lc/c/c/c/a;->b:Landroid/graphics/drawable/Drawable;

    if-ne v0, v1, :cond_10

    .line 4
    iput-object p1, p0, Lc/c/c/c/a;->d:Landroid/graphics/drawable/Drawable;

    .line 5
    :cond_10
    iget-object v0, p0, Lc/c/c/c/a;->e:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lc/c/c/c/a;->b:Landroid/graphics/drawable/Drawable;

    if-ne v0, v1, :cond_18

    .line 6
    iput-object p1, p0, Lc/c/c/c/a;->e:Landroid/graphics/drawable/Drawable;

    .line 7
    :cond_18
    iget-object v0, p0, Lc/c/c/c/a;->f:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lc/c/c/c/a;->b:Landroid/graphics/drawable/Drawable;

    if-ne v0, v1, :cond_20

    .line 8
    iput-object p1, p0, Lc/c/c/c/a;->f:Landroid/graphics/drawable/Drawable;

    .line 9
    :cond_20
    iget-object v0, p0, Lc/c/c/c/a;->g:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lc/c/c/c/a;->b:Landroid/graphics/drawable/Drawable;

    if-ne v0, v1, :cond_28

    .line 10
    iput-object p1, p0, Lc/c/c/c/a;->g:Landroid/graphics/drawable/Drawable;

    .line 11
    :cond_28
    iput-object p1, p0, Lc/c/c/c/a;->b:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method public a()V
    .registers 7

    .line 12
    iget-object v0, p0, Lc/c/c/c/a;->b:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_5

    return-void

    .line 13
    :cond_5
    iget-object v1, p0, Lc/c/c/c/a;->c:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_1f

    iget-object v1, p0, Lc/c/c/c/a;->d:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_1f

    iget-object v1, p0, Lc/c/c/c/a;->e:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_1f

    iget-object v1, p0, Lc/c/c/c/a;->f:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_1f

    iget-object v1, p0, Lc/c/c/c/a;->g:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_1f

    .line 14
    iget-object v1, p0, Lc/c/c/c/a;->a:Landroid/widget/CompoundButton;

    invoke-virtual {v1, v0}, Landroid/widget/CompoundButton;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 15
    :cond_1f
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 16
    iget-object v1, p0, Lc/c/c/c/a;->c:Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_34

    new-array v4, v2, [I

    const v5, 0x10100a7

    aput v5, v4, v3

    .line 17
    invoke-virtual {v0, v4, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 18
    :cond_34
    iget-object v1, p0, Lc/c/c/c/a;->d:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_42

    new-array v4, v2, [I

    const v5, 0x10100a0

    aput v5, v4, v3

    .line 19
    invoke-virtual {v0, v4, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 20
    :cond_42
    iget-object v1, p0, Lc/c/c/c/a;->e:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_50

    new-array v4, v2, [I

    const v5, -0x101009e

    aput v5, v4, v3

    .line 21
    invoke-virtual {v0, v4, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 22
    :cond_50
    iget-object v1, p0, Lc/c/c/c/a;->f:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_5e

    new-array v4, v2, [I

    const v5, 0x101009c

    aput v5, v4, v3

    .line 23
    invoke-virtual {v0, v4, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 24
    :cond_5e
    iget-object v1, p0, Lc/c/c/c/a;->g:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_6c

    new-array v2, v2, [I

    const v4, 0x10100a1

    aput v4, v2, v3

    .line 25
    invoke-virtual {v0, v2, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    :cond_6c
    new-array v1, v3, [I

    .line 26
    iget-object v2, p0, Lc/c/c/c/a;->b:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 27
    iget-object v1, p0, Lc/c/c/c/a;->a:Landroid/widget/CompoundButton;

    invoke-virtual {v1, v0}, Landroid/widget/CompoundButton;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
