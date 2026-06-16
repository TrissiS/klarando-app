.class public Landroidx/constraintlayout/motion/widget/MotionLayout$c;
.super Lb/f/a/b/o;
.source "MotionLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/motion/widget/MotionLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public a:F

.field public b:F

.field public c:F

.field public final synthetic d:Landroidx/constraintlayout/motion/widget/MotionLayout;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/motion/widget/MotionLayout;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->d:Landroidx/constraintlayout/motion/widget/MotionLayout;

    invoke-direct {p0}, Lb/f/a/b/o;-><init>()V

    const/4 p1, 0x0

    .line 2
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->a:F

    .line 3
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->b:F

    return-void
.end method


# virtual methods
.method public a()F
    .registers 2

    .line 4
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->d:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget v0, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A:F

    return v0
.end method

.method public a(FFF)V
    .registers 4

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->a:F

    .line 2
    iput p2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->b:F

    .line 3
    iput p3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->c:F

    return-void
.end method

.method public getInterpolation(F)F
    .registers 7

    .line 1
    iget v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->a:F

    const/high16 v1, 0x40000000    # 2.0f

    const/4 v2, 0x0

    cmpl-float v2, v0, v2

    if-lez v2, :cond_2b

    .line 2
    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->c:F

    div-float v3, v0, v2

    cmpg-float v3, v3, p1

    if-gez v3, :cond_13

    div-float p1, v0, v2

    .line 3
    :cond_13
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->d:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->a:F

    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->c:F

    mul-float v4, v3, p1

    sub-float v4, v2, v4

    iput v4, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A:F

    mul-float v2, v2, p1

    mul-float v3, v3, p1

    mul-float v3, v3, p1

    div-float/2addr v3, v1

    sub-float/2addr v2, v3

    .line 4
    iget p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->b:F

    :goto_29
    add-float/2addr v2, p1

    return v2

    :cond_2b
    neg-float v2, v0

    .line 5
    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->c:F

    div-float/2addr v2, v3

    cmpg-float v2, v2, p1

    if-gez v2, :cond_35

    neg-float p1, v0

    div-float/2addr p1, v3

    .line 6
    :cond_35
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->d:Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget v2, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->a:F

    iget v3, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->c:F

    mul-float v4, v3, p1

    add-float/2addr v4, v2

    iput v4, v0, Landroidx/constraintlayout/motion/widget/MotionLayout;->A:F

    mul-float v2, v2, p1

    mul-float v3, v3, p1

    mul-float v3, v3, p1

    div-float/2addr v3, v1

    add-float/2addr v2, v3

    .line 7
    iget p1, p0, Landroidx/constraintlayout/motion/widget/MotionLayout$c;->b:F

    goto :goto_29
.end method
