.class public Lb/f/a/b/q$b$a;
.super Ljava/lang/Object;
.source "MotionScene.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/f/a/b/q$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final h:Lb/f/a/b/q$b;

.field public i:I

.field public j:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lb/f/a/b/q$b;Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lb/f/a/b/q$b$a;->i:I

    const/16 v0, 0x11

    .line 3
    iput v0, p0, Lb/f/a/b/q$b$a;->j:I

    .line 4
    iput-object p2, p0, Lb/f/a/b/q$b$a;->h:Lb/f/a/b/q$b;

    .line 5
    invoke-static {p3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object p2

    sget-object p3, Lb/f/c/f;->OnClick:[I

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 6
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result p2

    const/4 p3, 0x0

    :goto_1b
    if-ge p3, p2, :cond_3d

    .line 7
    invoke-virtual {p1, p3}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v0

    .line 8
    sget v1, Lb/f/c/f;->OnClick_targetId:I

    if-ne v0, v1, :cond_2e

    .line 9
    iget v1, p0, Lb/f/a/b/q$b$a;->i:I

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    iput v0, p0, Lb/f/a/b/q$b$a;->i:I

    goto :goto_3a

    .line 10
    :cond_2e
    sget v1, Lb/f/c/f;->OnClick_clickAction:I

    if-ne v0, v1, :cond_3a

    .line 11
    iget v1, p0, Lb/f/a/b/q$b$a;->j:I

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Lb/f/a/b/q$b$a;->j:I

    :cond_3a
    :goto_3a
    add-int/lit8 p3, p3, 0x1

    goto :goto_1b

    .line 12
    :cond_3d
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public a(Landroidx/constraintlayout/motion/widget/MotionLayout;)V
    .registers 4

    .line 12
    iget v0, p0, Lb/f/a/b/q$b$a;->i:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_6

    return-void

    .line 13
    :cond_6
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_25

    .line 14
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, " (*)  could not find id "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lb/f/a/b/q$b$a;->i:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "MotionScene"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_25
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public a(Landroidx/constraintlayout/motion/widget/MotionLayout;ILb/f/a/b/q$b;)V
    .registers 9

    .line 1
    iget v0, p0, Lb/f/a/b/q$b$a;->i:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_6

    goto :goto_a

    :cond_6
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    :goto_a
    if-nez p1, :cond_25

    .line 2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "OnClick could not find id "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lb/f/a/b/q$b$a;->i:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "MotionScene"

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 3
    :cond_25
    invoke-static {p3}, Lb/f/a/b/q$b;->b(Lb/f/a/b/q$b;)I

    move-result v0

    .line 4
    invoke-static {p3}, Lb/f/a/b/q$b;->a(Lb/f/a/b/q$b;)I

    move-result p3

    if-ne v0, v1, :cond_33

    .line 5
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    .line 6
    :cond_33
    iget v1, p0, Lb/f/a/b/q$b$a;->j:I

    const/4 v2, 0x1

    and-int/2addr v1, v2

    const/4 v3, 0x0

    if-eqz v1, :cond_3e

    if-ne p2, v0, :cond_3e

    const/4 v1, 0x1

    goto :goto_3f

    :cond_3e
    const/4 v1, 0x0

    .line 7
    :goto_3f
    iget v4, p0, Lb/f/a/b/q$b$a;->j:I

    and-int/lit16 v4, v4, 0x100

    if-eqz v4, :cond_49

    if-ne p2, v0, :cond_49

    const/4 v4, 0x1

    goto :goto_4a

    :cond_49
    const/4 v4, 0x0

    :goto_4a
    or-int/2addr v1, v4

    .line 8
    iget v4, p0, Lb/f/a/b/q$b$a;->j:I

    and-int/2addr v4, v2

    if-eqz v4, :cond_54

    if-ne p2, v0, :cond_54

    const/4 v0, 0x1

    goto :goto_55

    :cond_54
    const/4 v0, 0x0

    :goto_55
    or-int/2addr v0, v1

    .line 9
    iget v1, p0, Lb/f/a/b/q$b$a;->j:I

    and-int/lit8 v1, v1, 0x10

    if-eqz v1, :cond_60

    if-ne p2, p3, :cond_60

    const/4 v1, 0x1

    goto :goto_61

    :cond_60
    const/4 v1, 0x0

    :goto_61
    or-int/2addr v0, v1

    .line 10
    iget v1, p0, Lb/f/a/b/q$b$a;->j:I

    and-int/lit16 v1, v1, 0x1000

    if-eqz v1, :cond_6b

    if-ne p2, p3, :cond_6b

    goto :goto_6c

    :cond_6b
    const/4 v2, 0x0

    :goto_6c
    or-int p2, v0, v2

    if-eqz p2, :cond_73

    .line 11
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_73
    return-void
.end method

.method public a(Lb/f/a/b/q$b;Landroidx/constraintlayout/motion/widget/MotionLayout;)Z
    .registers 7

    .line 16
    iget-object v0, p0, Lb/f/a/b/q$b$a;->h:Lb/f/a/b/q$b;

    const/4 v1, 0x1

    if-ne v0, p1, :cond_6

    return v1

    .line 17
    :cond_6
    invoke-static {v0}, Lb/f/a/b/q$b;->a(Lb/f/a/b/q$b;)I

    move-result p1

    .line 18
    iget-object v0, p0, Lb/f/a/b/q$b$a;->h:Lb/f/a/b/q$b;

    invoke-static {v0}, Lb/f/a/b/q$b;->b(Lb/f/a/b/q$b;)I

    move-result v0

    const/4 v2, -0x1

    const/4 v3, 0x0

    if-ne v0, v2, :cond_1b

    .line 19
    iget p2, p2, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    if-eq p2, p1, :cond_19

    goto :goto_1a

    :cond_19
    const/4 v1, 0x0

    :goto_1a
    return v1

    .line 20
    :cond_1b
    iget p2, p2, Landroidx/constraintlayout/motion/widget/MotionLayout;->C:I

    if-eq p2, v0, :cond_23

    if-ne p2, p1, :cond_22

    goto :goto_23

    :cond_22
    const/4 v1, 0x0

    :cond_23
    :goto_23
    return v1
.end method

.method public onClick(Landroid/view/View;)V
    .registers 9

    .line 1
    iget-object p1, p0, Lb/f/a/b/q$b$a;->h:Lb/f/a/b/q$b;

    invoke-static {p1}, Lb/f/a/b/q$b;->p(Lb/f/a/b/q$b;)Lb/f/a/b/q;

    move-result-object p1

    invoke-static {p1}, Lb/f/a/b/q;->c(Lb/f/a/b/q;)Landroidx/constraintlayout/motion/widget/MotionLayout;

    move-result-object p1

    .line 2
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->j()Z

    move-result v0

    if-nez v0, :cond_11

    return-void

    .line 3
    :cond_11
    iget-object v0, p0, Lb/f/a/b/q$b$a;->h:Lb/f/a/b/q$b;

    invoke-static {v0}, Lb/f/a/b/q$b;->b(Lb/f/a/b/q$b;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_4a

    .line 4
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getCurrentState()I

    move-result v0

    if-ne v0, v1, :cond_2a

    .line 5
    iget-object v0, p0, Lb/f/a/b/q$b$a;->h:Lb/f/a/b/q$b;

    invoke-static {v0}, Lb/f/a/b/q$b;->a(Lb/f/a/b/q$b;)I

    move-result v0

    invoke-virtual {p1, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->e(I)V

    return-void

    .line 6
    :cond_2a
    new-instance v1, Lb/f/a/b/q$b;

    iget-object v2, p0, Lb/f/a/b/q$b$a;->h:Lb/f/a/b/q$b;

    invoke-static {v2}, Lb/f/a/b/q$b;->p(Lb/f/a/b/q$b;)Lb/f/a/b/q;

    move-result-object v2

    iget-object v3, p0, Lb/f/a/b/q$b$a;->h:Lb/f/a/b/q$b;

    invoke-direct {v1, v2, v3}, Lb/f/a/b/q$b;-><init>(Lb/f/a/b/q;Lb/f/a/b/q$b;)V

    .line 7
    invoke-static {v1, v0}, Lb/f/a/b/q$b;->b(Lb/f/a/b/q$b;I)I

    .line 8
    iget-object v0, p0, Lb/f/a/b/q$b$a;->h:Lb/f/a/b/q$b;

    invoke-static {v0}, Lb/f/a/b/q$b;->a(Lb/f/a/b/q$b;)I

    move-result v0

    invoke-static {v1, v0}, Lb/f/a/b/q$b;->a(Lb/f/a/b/q$b;I)I

    .line 9
    invoke-virtual {p1, v1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setTransition(Lb/f/a/b/q$b;)V

    .line 10
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->p()V

    return-void

    .line 11
    :cond_4a
    iget-object v0, p0, Lb/f/a/b/q$b$a;->h:Lb/f/a/b/q$b;

    invoke-static {v0}, Lb/f/a/b/q$b;->p(Lb/f/a/b/q$b;)Lb/f/a/b/q;

    move-result-object v0

    iget-object v0, v0, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    .line 12
    iget v1, p0, Lb/f/a/b/q$b$a;->j:I

    and-int/lit8 v2, v1, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_61

    and-int/lit16 v1, v1, 0x100

    if-eqz v1, :cond_5f

    goto :goto_61

    :cond_5f
    const/4 v1, 0x0

    goto :goto_62

    :cond_61
    :goto_61
    const/4 v1, 0x1

    .line 13
    :goto_62
    iget v2, p0, Lb/f/a/b/q$b$a;->j:I

    and-int/lit8 v5, v2, 0x10

    if-nez v5, :cond_6f

    and-int/lit16 v2, v2, 0x1000

    if-eqz v2, :cond_6d

    goto :goto_6f

    :cond_6d
    const/4 v2, 0x0

    goto :goto_70

    :cond_6f
    :goto_6f
    const/4 v2, 0x1

    :goto_70
    if-eqz v1, :cond_76

    if-eqz v2, :cond_76

    const/4 v5, 0x1

    goto :goto_77

    :cond_76
    const/4 v5, 0x0

    :goto_77
    if-eqz v5, :cond_a0

    .line 14
    iget-object v5, p0, Lb/f/a/b/q$b$a;->h:Lb/f/a/b/q$b;

    invoke-static {v5}, Lb/f/a/b/q$b;->p(Lb/f/a/b/q$b;)Lb/f/a/b/q;

    move-result-object v5

    iget-object v5, v5, Lb/f/a/b/q;->c:Lb/f/a/b/q$b;

    iget-object v6, p0, Lb/f/a/b/q$b$a;->h:Lb/f/a/b/q$b;

    if-eq v5, v6, :cond_88

    .line 15
    invoke-virtual {p1, v6}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setTransition(Lb/f/a/b/q$b;)V

    .line 16
    :cond_88
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getCurrentState()I

    move-result v5

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getEndState()I

    move-result v6

    if-eq v5, v6, :cond_a1

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->getProgress()F

    move-result v5

    const/high16 v6, 0x3f000000    # 0.5f

    cmpl-float v5, v5, v6

    if-lez v5, :cond_9d

    goto :goto_a1

    :cond_9d
    move v3, v1

    const/4 v2, 0x0

    goto :goto_a1

    :cond_a0
    move v3, v1

    .line 17
    :cond_a1
    :goto_a1
    invoke-virtual {p0, v0, p1}, Lb/f/a/b/q$b$a;->a(Lb/f/a/b/q$b;Landroidx/constraintlayout/motion/widget/MotionLayout;)Z

    move-result v0

    if-eqz v0, :cond_ec

    if-eqz v3, :cond_b7

    .line 18
    iget v0, p0, Lb/f/a/b/q$b$a;->j:I

    and-int/2addr v0, v4

    if-eqz v0, :cond_b7

    .line 19
    iget-object v0, p0, Lb/f/a/b/q$b$a;->h:Lb/f/a/b/q$b;

    invoke-virtual {p1, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setTransition(Lb/f/a/b/q$b;)V

    .line 20
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->p()V

    goto :goto_ec

    :cond_b7
    if-eqz v2, :cond_c8

    .line 21
    iget v0, p0, Lb/f/a/b/q$b$a;->j:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_c8

    .line 22
    iget-object v0, p0, Lb/f/a/b/q$b$a;->h:Lb/f/a/b/q$b;

    invoke-virtual {p1, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setTransition(Lb/f/a/b/q$b;)V

    .line 23
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->q()V

    goto :goto_ec

    :cond_c8
    if-eqz v3, :cond_db

    .line 24
    iget v0, p0, Lb/f/a/b/q$b$a;->j:I

    and-int/lit16 v0, v0, 0x100

    if-eqz v0, :cond_db

    .line 25
    iget-object v0, p0, Lb/f/a/b/q$b$a;->h:Lb/f/a/b/q$b;

    invoke-virtual {p1, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setTransition(Lb/f/a/b/q$b;)V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 26
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setProgress(F)V

    goto :goto_ec

    :cond_db
    if-eqz v2, :cond_ec

    .line 27
    iget v0, p0, Lb/f/a/b/q$b$a;->j:I

    and-int/lit16 v0, v0, 0x1000

    if-eqz v0, :cond_ec

    .line 28
    iget-object v0, p0, Lb/f/a/b/q$b$a;->h:Lb/f/a/b/q$b;

    invoke-virtual {p1, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setTransition(Lb/f/a/b/q$b;)V

    const/4 v0, 0x0

    .line 29
    invoke-virtual {p1, v0}, Landroidx/constraintlayout/motion/widget/MotionLayout;->setProgress(F)V

    :cond_ec
    :goto_ec
    return-void
.end method
