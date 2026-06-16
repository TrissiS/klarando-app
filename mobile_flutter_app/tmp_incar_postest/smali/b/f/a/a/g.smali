.class public Lb/f/a/a/g;
.super Lb/f/a/b/o;
.source "StopLogic.java"


# instance fields
.field public a:F

.field public b:F

.field public c:F

.field public d:F

.field public e:F

.field public f:F

.field public g:F

.field public h:F

.field public i:F

.field public j:I

.field public k:Z

.field public l:F

.field public m:F


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lb/f/a/b/o;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lb/f/a/a/g;->k:Z

    return-void
.end method


# virtual methods
.method public a()F
    .registers 2

    .line 15
    iget-boolean v0, p0, Lb/f/a/a/g;->k:Z

    if-eqz v0, :cond_c

    iget v0, p0, Lb/f/a/a/g;->m:F

    invoke-virtual {p0, v0}, Lb/f/a/a/g;->b(F)F

    move-result v0

    neg-float v0, v0

    goto :goto_12

    :cond_c
    iget v0, p0, Lb/f/a/a/g;->m:F

    invoke-virtual {p0, v0}, Lb/f/a/a/g;->b(F)F

    move-result v0

    :goto_12
    return v0
.end method

.method public final a(F)F
    .registers 7

    .line 1
    iget v0, p0, Lb/f/a/a/g;->d:F

    const/high16 v1, 0x40000000    # 2.0f

    cmpg-float v2, p1, v0

    if-gtz v2, :cond_18

    .line 2
    iget v2, p0, Lb/f/a/a/g;->a:F

    mul-float v3, v2, p1

    iget v4, p0, Lb/f/a/a/g;->b:F

    sub-float/2addr v4, v2

    mul-float v4, v4, p1

    mul-float v4, v4, p1

    mul-float v0, v0, v1

    div-float/2addr v4, v0

    add-float/2addr v3, v4

    return v3

    .line 3
    :cond_18
    iget v2, p0, Lb/f/a/a/g;->j:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_20

    .line 4
    iget p1, p0, Lb/f/a/a/g;->g:F

    return p1

    :cond_20
    sub-float/2addr p1, v0

    .line 5
    iget v0, p0, Lb/f/a/a/g;->e:F

    cmpg-float v3, p1, v0

    if-gez v3, :cond_3a

    .line 6
    iget v2, p0, Lb/f/a/a/g;->g:F

    iget v3, p0, Lb/f/a/a/g;->b:F

    mul-float v4, v3, p1

    add-float/2addr v2, v4

    iget v4, p0, Lb/f/a/a/g;->c:F

    sub-float/2addr v4, v3

    mul-float v4, v4, p1

    mul-float v4, v4, p1

    mul-float v0, v0, v1

    div-float/2addr v4, v0

    add-float/2addr v2, v4

    return v2

    :cond_3a
    const/4 v3, 0x2

    if-ne v2, v3, :cond_40

    .line 7
    iget p1, p0, Lb/f/a/a/g;->h:F

    return p1

    :cond_40
    sub-float/2addr p1, v0

    .line 8
    iget v0, p0, Lb/f/a/a/g;->f:F

    cmpg-float v2, p1, v0

    if-gez v2, :cond_57

    .line 9
    iget v2, p0, Lb/f/a/a/g;->h:F

    iget v3, p0, Lb/f/a/a/g;->c:F

    mul-float v4, v3, p1

    add-float/2addr v2, v4

    mul-float v3, v3, p1

    mul-float v3, v3, p1

    mul-float v0, v0, v1

    div-float/2addr v3, v0

    sub-float/2addr v2, v3

    return v2

    .line 10
    :cond_57
    iget p1, p0, Lb/f/a/a/g;->i:F

    return p1
.end method

.method public final a(FFFFF)V
    .registers 14

    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-nez v1, :cond_8

    const p1, 0x38d1b717    # 1.0E-4f

    .line 16
    :cond_8
    iput p1, p0, Lb/f/a/a/g;->a:F

    div-float v1, p1, p3

    mul-float v2, v1, p1

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    const/4 v4, 0x3

    const/4 v5, 0x2

    cmpg-float v6, p1, v0

    if-gez v6, :cond_6d

    neg-float p5, p1

    div-float/2addr p5, p3

    mul-float p5, p5, p1

    div-float/2addr p5, v3

    sub-float p5, p2, p5

    mul-float p5, p5, p3

    float-to-double v1, p5

    .line 17
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-float p5, v1

    cmpg-float v1, p5, p4

    if-gez v1, :cond_46

    .line 18
    iput v5, p0, Lb/f/a/a/g;->j:I

    .line 19
    iput p1, p0, Lb/f/a/a/g;->a:F

    .line 20
    iput p5, p0, Lb/f/a/a/g;->b:F

    .line 21
    iput v0, p0, Lb/f/a/a/g;->c:F

    sub-float p4, p5, p1

    div-float/2addr p4, p3

    .line 22
    iput p4, p0, Lb/f/a/a/g;->d:F

    div-float p3, p5, p3

    .line 23
    iput p3, p0, Lb/f/a/a/g;->e:F

    add-float/2addr p1, p5

    mul-float p1, p1, p4

    div-float/2addr p1, v3

    .line 24
    iput p1, p0, Lb/f/a/a/g;->g:F

    .line 25
    iput p2, p0, Lb/f/a/a/g;->h:F

    .line 26
    iput p2, p0, Lb/f/a/a/g;->i:F

    return-void

    .line 27
    :cond_46
    iput v4, p0, Lb/f/a/a/g;->j:I

    .line 28
    iput p1, p0, Lb/f/a/a/g;->a:F

    .line 29
    iput p4, p0, Lb/f/a/a/g;->b:F

    .line 30
    iput p4, p0, Lb/f/a/a/g;->c:F

    sub-float p5, p4, p1

    div-float/2addr p5, p3

    .line 31
    iput p5, p0, Lb/f/a/a/g;->d:F

    div-float p3, p4, p3

    .line 32
    iput p3, p0, Lb/f/a/a/g;->f:F

    add-float/2addr p1, p4

    mul-float p1, p1, p5

    div-float/2addr p1, v3

    mul-float p3, p3, p4

    div-float/2addr p3, v3

    sub-float p5, p2, p1

    sub-float/2addr p5, p3

    div-float/2addr p5, p4

    .line 33
    iput p5, p0, Lb/f/a/a/g;->e:F

    .line 34
    iput p1, p0, Lb/f/a/a/g;->g:F

    sub-float p1, p2, p3

    .line 35
    iput p1, p0, Lb/f/a/a/g;->h:F

    .line 36
    iput p2, p0, Lb/f/a/a/g;->i:F

    return-void

    :cond_6d
    cmpl-float v6, v2, p2

    if-ltz v6, :cond_80

    mul-float v3, v3, p2

    div-float/2addr v3, p1

    const/4 p3, 0x1

    .line 37
    iput p3, p0, Lb/f/a/a/g;->j:I

    .line 38
    iput p1, p0, Lb/f/a/a/g;->a:F

    .line 39
    iput v0, p0, Lb/f/a/a/g;->b:F

    .line 40
    iput p2, p0, Lb/f/a/a/g;->g:F

    .line 41
    iput v3, p0, Lb/f/a/a/g;->d:F

    return-void

    :cond_80
    sub-float v2, p2, v2

    div-float v6, v2, p1

    add-float v7, v6, v1

    cmpg-float p5, v7, p5

    if-gez p5, :cond_9b

    .line 42
    iput v5, p0, Lb/f/a/a/g;->j:I

    .line 43
    iput p1, p0, Lb/f/a/a/g;->a:F

    .line 44
    iput p1, p0, Lb/f/a/a/g;->b:F

    .line 45
    iput v0, p0, Lb/f/a/a/g;->c:F

    .line 46
    iput v2, p0, Lb/f/a/a/g;->g:F

    .line 47
    iput p2, p0, Lb/f/a/a/g;->h:F

    .line 48
    iput v6, p0, Lb/f/a/a/g;->d:F

    .line 49
    iput v1, p0, Lb/f/a/a/g;->e:F

    return-void

    :cond_9b
    mul-float p5, p3, p2

    mul-float v1, p1, p1

    div-float/2addr v1, v3

    add-float/2addr p5, v1

    float-to-double v1, p5

    .line 50
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-float p5, v1

    sub-float v1, p5, p1

    div-float/2addr v1, p3

    .line 51
    iput v1, p0, Lb/f/a/a/g;->d:F

    div-float v2, p5, p3

    .line 52
    iput v2, p0, Lb/f/a/a/g;->e:F

    cmpg-float v6, p5, p4

    if-gez v6, :cond_c9

    .line 53
    iput v5, p0, Lb/f/a/a/g;->j:I

    .line 54
    iput p1, p0, Lb/f/a/a/g;->a:F

    .line 55
    iput p5, p0, Lb/f/a/a/g;->b:F

    .line 56
    iput v0, p0, Lb/f/a/a/g;->c:F

    .line 57
    iput v1, p0, Lb/f/a/a/g;->d:F

    .line 58
    iput v2, p0, Lb/f/a/a/g;->e:F

    add-float/2addr p1, p5

    mul-float p1, p1, v1

    div-float/2addr p1, v3

    .line 59
    iput p1, p0, Lb/f/a/a/g;->g:F

    .line 60
    iput p2, p0, Lb/f/a/a/g;->h:F

    return-void

    .line 61
    :cond_c9
    iput v4, p0, Lb/f/a/a/g;->j:I

    .line 62
    iput p1, p0, Lb/f/a/a/g;->a:F

    .line 63
    iput p4, p0, Lb/f/a/a/g;->b:F

    .line 64
    iput p4, p0, Lb/f/a/a/g;->c:F

    sub-float p5, p4, p1

    div-float/2addr p5, p3

    .line 65
    iput p5, p0, Lb/f/a/a/g;->d:F

    div-float p3, p4, p3

    .line 66
    iput p3, p0, Lb/f/a/a/g;->f:F

    add-float/2addr p1, p4

    mul-float p1, p1, p5

    div-float/2addr p1, v3

    mul-float p3, p3, p4

    div-float/2addr p3, v3

    sub-float p5, p2, p1

    sub-float/2addr p5, p3

    div-float/2addr p5, p4

    .line 67
    iput p5, p0, Lb/f/a/a/g;->e:F

    .line 68
    iput p1, p0, Lb/f/a/a/g;->g:F

    sub-float p1, p2, p3

    .line 69
    iput p1, p0, Lb/f/a/a/g;->h:F

    .line 70
    iput p2, p0, Lb/f/a/a/g;->i:F

    return-void
.end method

.method public a(FFFFFF)V
    .registers 13

    .line 11
    iput p1, p0, Lb/f/a/a/g;->l:F

    cmpl-float v1, p1, p2

    if-lez v1, :cond_8

    const/4 v1, 0x1

    goto :goto_9

    :cond_8
    const/4 v1, 0x0

    .line 12
    :goto_9
    iput-boolean v1, p0, Lb/f/a/a/g;->k:Z

    if-eqz v1, :cond_18

    neg-float v1, p3

    sub-float v2, p1, p2

    move-object v0, p0

    move v3, p5

    move v4, p6

    move v5, p4

    .line 13
    invoke-virtual/range {v0 .. v5}, Lb/f/a/a/g;->a(FFFFF)V

    goto :goto_22

    :cond_18
    sub-float v2, p2, p1

    move-object v0, p0

    move v1, p3

    move v3, p5

    move v4, p6

    move v5, p4

    .line 14
    invoke-virtual/range {v0 .. v5}, Lb/f/a/a/g;->a(FFFFF)V

    :goto_22
    return-void
.end method

.method public b(F)F
    .registers 5

    .line 1
    iget v0, p0, Lb/f/a/a/g;->d:F

    cmpg-float v1, p1, v0

    if-gtz v1, :cond_10

    .line 2
    iget v1, p0, Lb/f/a/a/g;->a:F

    iget v2, p0, Lb/f/a/a/g;->b:F

    sub-float/2addr v2, v1

    mul-float v2, v2, p1

    div-float/2addr v2, v0

    add-float/2addr v1, v2

    return v1

    .line 3
    :cond_10
    iget v1, p0, Lb/f/a/a/g;->j:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_17

    const/4 p1, 0x0

    return p1

    :cond_17
    sub-float/2addr p1, v0

    .line 4
    iget v0, p0, Lb/f/a/a/g;->e:F

    cmpg-float v2, p1, v0

    if-gez v2, :cond_28

    .line 5
    iget v1, p0, Lb/f/a/a/g;->b:F

    iget v2, p0, Lb/f/a/a/g;->c:F

    sub-float/2addr v2, v1

    mul-float v2, v2, p1

    div-float/2addr v2, v0

    add-float/2addr v1, v2

    return v1

    :cond_28
    const/4 v2, 0x2

    if-ne v1, v2, :cond_2e

    .line 6
    iget p1, p0, Lb/f/a/a/g;->h:F

    return p1

    :cond_2e
    sub-float/2addr p1, v0

    .line 7
    iget v0, p0, Lb/f/a/a/g;->f:F

    cmpg-float v1, p1, v0

    if-gez v1, :cond_3c

    .line 8
    iget v1, p0, Lb/f/a/a/g;->c:F

    mul-float p1, p1, v1

    div-float/2addr p1, v0

    sub-float/2addr v1, p1

    return v1

    .line 9
    :cond_3c
    iget p1, p0, Lb/f/a/a/g;->i:F

    return p1
.end method

.method public getInterpolation(F)F
    .registers 3

    .line 1
    invoke-virtual {p0, p1}, Lb/f/a/a/g;->a(F)F

    move-result v0

    .line 2
    iput p1, p0, Lb/f/a/a/g;->m:F

    .line 3
    iget-boolean p1, p0, Lb/f/a/a/g;->k:Z

    if-eqz p1, :cond_e

    iget p1, p0, Lb/f/a/a/g;->l:F

    sub-float/2addr p1, v0

    goto :goto_11

    :cond_e
    iget p1, p0, Lb/f/a/a/g;->l:F

    add-float/2addr p1, v0

    :goto_11
    return p1
.end method
