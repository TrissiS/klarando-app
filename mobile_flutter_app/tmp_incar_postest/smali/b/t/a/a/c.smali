.class public Lb/t/a/a/c;
.super Lb/t/a/a/h;
.source "AnimatedVectorDrawableCompat.java"

# interfaces
.implements Lb/t/a/a/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/t/a/a/c$b;,
        Lb/t/a/a/c$c;
    }
.end annotation


# instance fields
.field public i:Lb/t/a/a/c$b;

.field public j:Landroid/content/Context;

.field public k:Landroid/animation/ArgbEvaluator;

.field public final l:Landroid/graphics/drawable/Drawable$Callback;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0, v0, v0}, Lb/t/a/a/c;-><init>(Landroid/content/Context;Lb/t/a/a/c$b;Landroid/content/res/Resources;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0, v0}, Lb/t/a/a/c;-><init>(Landroid/content/Context;Lb/t/a/a/c$b;Landroid/content/res/Resources;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lb/t/a/a/c$b;Landroid/content/res/Resources;)V
    .registers 6

    .line 3
    invoke-direct {p0}, Lb/t/a/a/h;-><init>()V

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lb/t/a/a/c;->k:Landroid/animation/ArgbEvaluator;

    .line 5
    new-instance v0, Lb/t/a/a/c$a;

    invoke-direct {v0, p0}, Lb/t/a/a/c$a;-><init>(Lb/t/a/a/c;)V

    iput-object v0, p0, Lb/t/a/a/c;->l:Landroid/graphics/drawable/Drawable$Callback;

    .line 6
    iput-object p1, p0, Lb/t/a/a/c;->j:Landroid/content/Context;

    if-eqz p2, :cond_14

    .line 7
    iput-object p2, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    goto :goto_1d

    .line 8
    :cond_14
    new-instance v0, Lb/t/a/a/c$b;

    iget-object v1, p0, Lb/t/a/a/c;->l:Landroid/graphics/drawable/Drawable$Callback;

    invoke-direct {v0, p1, p2, v1, p3}, Lb/t/a/a/c$b;-><init>(Landroid/content/Context;Lb/t/a/a/c$b;Landroid/graphics/drawable/Drawable$Callback;Landroid/content/res/Resources;)V

    iput-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    :goto_1d
    return-void
.end method

.method public static a(Landroid/content/Context;Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Lb/t/a/a/c;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lb/t/a/a/c;

    invoke-direct {v0, p0}, Lb/t/a/a/c;-><init>(Landroid/content/Context;)V

    .line 2
    invoke-virtual {v0, p1, p2, p3, p4}, Lb/t/a/a/c;->inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    return-object v0
.end method


# virtual methods
.method public final a(Landroid/animation/Animator;)V
    .registers 5

    .line 3
    instance-of v0, p1, Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_20

    .line 4
    move-object v0, p1

    check-cast v0, Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->getChildAnimations()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_20

    const/4 v1, 0x0

    .line 5
    :goto_e
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_20

    .line 6
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/animation/Animator;

    invoke-virtual {p0, v2}, Lb/t/a/a/c;->a(Landroid/animation/Animator;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 7
    :cond_20
    instance-of v0, p1, Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_4a

    .line 8
    check-cast p1, Landroid/animation/ObjectAnimator;

    .line 9
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->getPropertyName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "fillColor"

    .line 10
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3a

    const-string v1, "strokeColor"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4a

    .line 11
    :cond_3a
    iget-object v0, p0, Lb/t/a/a/c;->k:Landroid/animation/ArgbEvaluator;

    if-nez v0, :cond_45

    .line 12
    new-instance v0, Landroid/animation/ArgbEvaluator;

    invoke-direct {v0}, Landroid/animation/ArgbEvaluator;-><init>()V

    iput-object v0, p0, Lb/t/a/a/c;->k:Landroid/animation/ArgbEvaluator;

    .line 13
    :cond_45
    iget-object v0, p0, Lb/t/a/a/c;->k:Landroid/animation/ArgbEvaluator;

    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    :cond_4a
    return-void
.end method

.method public final a(Ljava/lang/String;Landroid/animation/Animator;)V
    .registers 5

    .line 14
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0, p1}, Lb/t/a/a/i;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 15
    invoke-virtual {p2, v0}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 16
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_14

    .line 17
    invoke-virtual {p0, p2}, Lb/t/a/a/c;->a(Landroid/animation/Animator;)V

    .line 18
    :cond_14
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v1, v0, Lb/t/a/a/c$b;->d:Ljava/util/ArrayList;

    if-nez v1, :cond_2a

    .line 19
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lb/t/a/a/c$b;->d:Ljava/util/ArrayList;

    .line 20
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    new-instance v1, Lb/e/a;

    invoke-direct {v1}, Lb/e/a;-><init>()V

    iput-object v1, v0, Lb/t/a/a/c$b;->e:Lb/e/a;

    .line 21
    :cond_2a
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->d:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->e:Lb/e/a;

    invoke-virtual {v0, p2, p1}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public applyTheme(Landroid/content/res/Resources$Theme;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_7

    .line 2
    invoke-static {v0, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/Resources$Theme;)V

    :cond_7
    return-void
.end method

.method public canApplyTheme()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-static {v0}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    return v0

    :cond_9
    const/4 v0, 0x0

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void

    .line 3
    :cond_8
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0, p1}, Lb/t/a/a/i;->draw(Landroid/graphics/Canvas;)V

    .line 4
    iget-object p1, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object p1, p1, Lb/t/a/a/c$b;->c:Landroid/animation/AnimatorSet;

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->isStarted()Z

    move-result p1

    if-eqz p1, :cond_1c

    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_1c
    return-void
.end method

.method public getAlpha()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-static {v0}, Lb/h/f/l/a;->c(Landroid/graphics/drawable/Drawable;)I

    move-result v0

    return v0

    .line 3
    :cond_9
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0}, Lb/t/a/a/i;->getAlpha()I

    move-result v0

    return v0
.end method

.method public getChangingConfigurations()I
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    move-result v0

    return v0

    .line 3
    :cond_9
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    move-result v0

    iget-object v1, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget v1, v1, Lb/t/a/a/c$b;->a:I

    or-int/2addr v0, v1

    return v0
.end method

.method public getColorFilter()Landroid/graphics/ColorFilter;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-static {v0}, Lb/h/f/l/a;->d(Landroid/graphics/drawable/Drawable;)Landroid/graphics/ColorFilter;

    move-result-object v0

    return-object v0

    .line 3
    :cond_9
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0}, Lb/t/a/a/i;->getColorFilter()Landroid/graphics/ColorFilter;

    move-result-object v0

    return-object v0
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_16

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_16

    .line 2
    new-instance v0, Lb/t/a/a/c$c;

    iget-object v1, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v1

    invoke-direct {v0, v1}, Lb/t/a/a/c$c;-><init>(Landroid/graphics/drawable/Drawable$ConstantState;)V

    return-object v0

    :cond_16
    const/4 v0, 0x0

    return-object v0
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    return v0

    .line 3
    :cond_9
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0}, Lb/t/a/a/i;->getIntrinsicHeight()I

    move-result v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    return v0

    .line 3
    :cond_9
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0}, Lb/t/a/a/i;->getIntrinsicWidth()I

    move-result v0

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v0

    return v0

    .line 3
    :cond_9
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0}, Lb/t/a/a/i;->getOpacity()I

    move-result v0

    return v0
.end method

.method public inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 31
    invoke-virtual {p0, p1, p2, p3, v0}, Lb/t/a/a/c;->inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    return-void
.end method

.method public inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-static {v0, p1, p2, p3, p4}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    return-void

    .line 3
    :cond_8
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    .line 4
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    :goto_12
    if-eq v0, v2, :cond_8e

    .line 5
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v3

    if-ge v3, v1, :cond_1d

    const/4 v3, 0x3

    if-eq v0, v3, :cond_8e

    :cond_1d
    const/4 v3, 0x2

    if-ne v0, v3, :cond_89

    .line 6
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v3, "animated-vector"

    .line 7
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_57

    .line 8
    sget-object v0, Lb/t/a/a/a;->e:[I

    .line 9
    invoke-static {p1, p4, p3, v0}, Lb/h/e/c/g;->a(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 10
    invoke-virtual {v0, v4, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    if-eqz v3, :cond_53

    .line 11
    invoke-static {p1, v3, p4}, Lb/t/a/a/i;->a(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Lb/t/a/a/i;

    move-result-object v3

    .line 12
    invoke-virtual {v3, v4}, Lb/t/a/a/i;->a(Z)V

    .line 13
    iget-object v4, p0, Lb/t/a/a/c;->l:Landroid/graphics/drawable/Drawable$Callback;

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 14
    iget-object v4, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v4, v4, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    if-eqz v4, :cond_4f

    const/4 v5, 0x0

    .line 15
    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 16
    :cond_4f
    iget-object v4, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iput-object v3, v4, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    .line 17
    :cond_53
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_89

    :cond_57
    const-string v3, "target"

    .line 18
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_89

    .line 19
    sget-object v0, Lb/t/a/a/a;->f:[I

    .line 20
    invoke-virtual {p1, p3, v0}, Landroid/content/res/Resources;->obtainAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 21
    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 22
    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    if-eqz v4, :cond_86

    .line 23
    iget-object v5, p0, Lb/t/a/a/c;->j:Landroid/content/Context;

    if-eqz v5, :cond_7b

    .line 24
    invoke-static {v5, v4}, Lb/t/a/a/e;->a(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object v4

    .line 25
    invoke-virtual {p0, v3, v4}, Lb/t/a/a/c;->a(Ljava/lang/String;Landroid/animation/Animator;)V

    goto :goto_86

    .line 26
    :cond_7b
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 27
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Context can\'t be null when inflating animators"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 28
    :cond_86
    :goto_86
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 29
    :cond_89
    :goto_89
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    goto :goto_12

    .line 30
    :cond_8e
    iget-object p1, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    invoke-virtual {p1}, Lb/t/a/a/c$b;->a()V

    return-void
.end method

.method public isAutoMirrored()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-static {v0}, Lb/h/f/l/a;->f(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    return v0

    .line 3
    :cond_9
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0}, Lb/t/a/a/i;->isAutoMirrored()Z

    move-result v0

    return v0
.end method

.method public isRunning()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_b

    .line 2
    check-cast v0, Landroid/graphics/drawable/AnimatedVectorDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimatedVectorDrawable;->isRunning()Z

    move-result v0

    return v0

    .line 3
    :cond_b
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->c:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v0

    return v0
.end method

.method public isStateful()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    return v0

    .line 3
    :cond_9
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0}, Lb/t/a/a/i;->isStateful()Z

    move-result v0

    return v0
.end method

.method public mutate()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    :cond_7
    return-object p0
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    return-void

    .line 3
    :cond_8
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    return-void
.end method

.method public onLevelChange(I)Z
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    move-result p1

    return p1

    .line 3
    :cond_9
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    move-result p1

    return p1
.end method

.method public onStateChange([I)Z
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result p1

    return p1

    .line 3
    :cond_9
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0, p1}, Lb/t/a/a/h;->setState([I)Z

    move-result p1

    return p1
.end method

.method public setAlpha(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    return-void

    .line 3
    :cond_8
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0, p1}, Lb/t/a/a/i;->setAlpha(I)V

    return-void
.end method

.method public setAutoMirrored(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-static {v0, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Z)V

    return-void

    .line 3
    :cond_8
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0, p1}, Lb/t/a/a/i;->setAutoMirrored(Z)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    return-void

    .line 3
    :cond_8
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0, p1}, Lb/t/a/a/i;->setColorFilter(Landroid/graphics/ColorFilter;)V

    return-void
.end method

.method public setTint(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-static {v0, p1}, Lb/h/f/l/a;->b(Landroid/graphics/drawable/Drawable;I)V

    return-void

    .line 3
    :cond_8
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0, p1}, Lb/t/a/a/i;->setTint(I)V

    return-void
.end method

.method public setTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-static {v0, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    return-void

    .line 3
    :cond_8
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0, p1}, Lb/t/a/a/i;->setTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    .line 2
    invoke-static {v0, p1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    return-void

    .line 3
    :cond_8
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0, p1}, Lb/t/a/a/i;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public setVisible(ZZ)Z
    .registers 4

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result p1

    return p1

    .line 3
    :cond_9
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->b:Lb/t/a/a/i;

    invoke-virtual {v0, p1, p2}, Lb/t/a/a/i;->setVisible(ZZ)Z

    .line 4
    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result p1

    return p1
.end method

.method public start()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_a

    .line 2
    check-cast v0, Landroid/graphics/drawable/AnimatedVectorDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimatedVectorDrawable;->start()V

    return-void

    .line 3
    :cond_a
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->c:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_15

    return-void

    .line 4
    :cond_15
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->c:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public stop()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/t/a/a/h;->h:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_a

    .line 2
    check-cast v0, Landroid/graphics/drawable/AnimatedVectorDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimatedVectorDrawable;->stop()V

    return-void

    .line 3
    :cond_a
    iget-object v0, p0, Lb/t/a/a/c;->i:Lb/t/a/a/c$b;

    iget-object v0, v0, Lb/t/a/a/c$b;->c:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    return-void
.end method
