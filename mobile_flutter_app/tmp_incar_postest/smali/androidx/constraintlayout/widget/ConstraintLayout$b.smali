.class public Landroidx/constraintlayout/widget/ConstraintLayout$b;
.super Ljava/lang/Object;
.source "ConstraintLayout.java"

# interfaces
.implements Lb/f/b/k/n/b$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/widget/ConstraintLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    .line 97
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v0, :cond_1e

    .line 98
    iget-object v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 99
    instance-of v4, v3, Landroidx/constraintlayout/widget/Placeholder;

    if-eqz v4, :cond_1b

    .line 100
    check-cast v3, Landroidx/constraintlayout/widget/Placeholder;

    iget-object v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v3, v4}, Landroidx/constraintlayout/widget/Placeholder;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    :cond_1b
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 101
    :cond_1e
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-static {v0}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_40

    :goto_2a
    if-ge v1, v0, :cond_40

    .line 102
    iget-object v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-static {v2}, Landroidx/constraintlayout/widget/ConstraintLayout;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 103
    iget-object v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v2, v3}, Landroidx/constraintlayout/widget/ConstraintHelper;->d(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2a

    :cond_40
    return-void
.end method

.method public a(IIIIII)V
    .registers 7

    .line 1
    iput p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->b:I

    .line 2
    iput p4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->c:I

    .line 3
    iput p5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->d:I

    .line 4
    iput p6, p0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->e:I

    .line 5
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->f:I

    .line 6
    iput p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->g:I

    return-void
.end method

.method public final a(Lb/f/b/k/e;Lb/f/b/k/n/b$a;)V
    .registers 22
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongCall"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    if-nez v1, :cond_9

    return-void

    .line 7
    :cond_9
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->z()I

    move-result v3

    const/16 v4, 0x8

    const/4 v5, 0x0

    if-ne v3, v4, :cond_1f

    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->F()Z

    move-result v3

    if-nez v3, :cond_1f

    .line 8
    iput v5, v2, Lb/f/b/k/n/b$a;->e:I

    .line 9
    iput v5, v2, Lb/f/b/k/n/b$a;->f:I

    .line 10
    iput v5, v2, Lb/f/b/k/n/b$a;->g:I

    return-void

    .line 11
    :cond_1f
    iget-object v3, v2, Lb/f/b/k/n/b$a;->a:Lb/f/b/k/e$b;

    .line 12
    iget-object v4, v2, Lb/f/b/k/n/b$a;->b:Lb/f/b/k/e$b;

    .line 13
    iget v6, v2, Lb/f/b/k/n/b$a;->c:I

    .line 14
    iget v7, v2, Lb/f/b/k/n/b$a;->d:I

    .line 15
    iget v8, v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->b:I

    iget v9, v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->c:I

    add-int/2addr v8, v9

    .line 16
    iget v9, v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->d:I

    .line 17
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->g()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/View;

    .line 18
    sget-object v11, Landroidx/constraintlayout/widget/ConstraintLayout$a;->a:[I

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v12

    aget v11, v11, v12

    const/4 v12, 0x4

    const/4 v14, -0x2

    const/4 v13, 0x3

    const/4 v15, 0x2

    const/4 v5, 0x1

    if-eq v11, v5, :cond_a4

    if-eq v11, v15, :cond_98

    if-eq v11, v13, :cond_87

    if-eq v11, v12, :cond_4c

    const/4 v6, 0x0

    :goto_4a
    const/4 v9, 0x0

    goto :goto_b0

    .line 19
    :cond_4c
    iget v6, v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->f:I

    invoke-static {v6, v9, v14}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v6

    .line 20
    iget v9, v1, Lb/f/b/k/e;->j:I

    if-ne v9, v5, :cond_58

    const/4 v9, 0x1

    goto :goto_59

    :cond_58
    const/4 v9, 0x0

    .line 21
    :goto_59
    iget-object v11, v1, Lb/f/b/k/e;->g:[I

    const/16 v16, 0x0

    aput v16, v11, v15

    .line 22
    iget-boolean v12, v2, Lb/f/b/k/n/b$a;->j:Z

    if-eqz v12, :cond_a2

    if-eqz v9, :cond_71

    .line 23
    aget v12, v11, v13

    if-eqz v12, :cond_71

    aget v11, v11, v16

    .line 24
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->A()I

    move-result v12

    if-ne v11, v12, :cond_75

    :cond_71
    instance-of v11, v10, Landroidx/constraintlayout/widget/Placeholder;

    if-eqz v11, :cond_77

    :cond_75
    const/4 v11, 0x1

    goto :goto_78

    :cond_77
    const/4 v11, 0x0

    :goto_78
    if-eqz v9, :cond_7c

    if-eqz v11, :cond_a2

    .line 25
    :cond_7c
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->A()I

    move-result v6

    const/high16 v9, 0x40000000    # 2.0f

    invoke-static {v6, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    goto :goto_4a

    .line 26
    :cond_87
    iget v6, v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->f:I

    .line 27
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->o()I

    move-result v11

    add-int/2addr v9, v11

    const/4 v11, -0x1

    .line 28
    invoke-static {v6, v9, v11}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v6

    .line 29
    iget-object v9, v1, Lb/f/b/k/e;->g:[I

    aput v11, v9, v15

    goto :goto_4a

    .line 30
    :cond_98
    iget v6, v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->f:I

    invoke-static {v6, v9, v14}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v6

    .line 31
    iget-object v9, v1, Lb/f/b/k/e;->g:[I

    aput v14, v9, v15

    :cond_a2
    const/4 v9, 0x1

    goto :goto_b0

    :cond_a4
    const/high16 v9, 0x40000000    # 2.0f

    .line 32
    invoke-static {v6, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v11

    .line 33
    iget-object v9, v1, Lb/f/b/k/e;->g:[I

    aput v6, v9, v15

    move v6, v11

    goto :goto_4a

    .line 34
    :goto_b0
    sget-object v11, Landroidx/constraintlayout/widget/ConstraintLayout$a;->a:[I

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v12

    aget v11, v11, v12

    if-eq v11, v5, :cond_11d

    if-eq v11, v15, :cond_110

    if-eq v11, v13, :cond_fe

    const/4 v7, 0x4

    if-eq v11, v7, :cond_c4

    const/4 v7, 0x0

    const/4 v11, 0x0

    goto :goto_128

    .line 35
    :cond_c4
    iget v7, v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->g:I

    invoke-static {v7, v8, v14}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v7

    .line 36
    iget v8, v1, Lb/f/b/k/e;->k:I

    if-ne v8, v5, :cond_d0

    const/4 v8, 0x1

    goto :goto_d1

    :cond_d0
    const/4 v8, 0x0

    .line 37
    :goto_d1
    iget-object v11, v1, Lb/f/b/k/e;->g:[I

    const/4 v12, 0x0

    aput v12, v11, v13

    .line 38
    iget-boolean v12, v2, Lb/f/b/k/n/b$a;->j:Z

    if-eqz v12, :cond_11a

    if-eqz v8, :cond_e8

    .line 39
    aget v12, v11, v15

    if-eqz v12, :cond_e8

    aget v11, v11, v5

    .line 40
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->k()I

    move-result v12

    if-ne v11, v12, :cond_ec

    :cond_e8
    instance-of v11, v10, Landroidx/constraintlayout/widget/Placeholder;

    if-eqz v11, :cond_ee

    :cond_ec
    const/4 v11, 0x1

    goto :goto_ef

    :cond_ee
    const/4 v11, 0x0

    :goto_ef
    if-eqz v8, :cond_f3

    if-eqz v11, :cond_11a

    .line 41
    :cond_f3
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->k()I

    move-result v7

    const/high16 v8, 0x40000000    # 2.0f

    invoke-static {v7, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    goto :goto_10e

    .line 42
    :cond_fe
    iget v7, v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->g:I

    .line 43
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->y()I

    move-result v11

    add-int/2addr v8, v11

    const/4 v11, -0x1

    .line 44
    invoke-static {v7, v8, v11}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v7

    .line 45
    iget-object v8, v1, Lb/f/b/k/e;->g:[I

    aput v11, v8, v13

    :goto_10e
    move v11, v7

    goto :goto_127

    .line 46
    :cond_110
    iget v7, v0, Landroidx/constraintlayout/widget/ConstraintLayout$b;->g:I

    invoke-static {v7, v8, v14}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v7

    .line 47
    iget-object v8, v1, Lb/f/b/k/e;->g:[I

    aput v14, v8, v13

    :cond_11a
    move v11, v7

    const/4 v7, 0x1

    goto :goto_128

    :cond_11d
    const/high16 v8, 0x40000000    # 2.0f

    .line 48
    invoke-static {v7, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v11

    .line 49
    iget-object v8, v1, Lb/f/b/k/e;->g:[I

    aput v7, v8, v13

    :goto_127
    const/4 v7, 0x0

    .line 50
    :goto_128
    sget-object v8, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v3, v8, :cond_12e

    const/4 v8, 0x1

    goto :goto_12f

    :cond_12e
    const/4 v8, 0x0

    .line 51
    :goto_12f
    sget-object v12, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v4, v12, :cond_135

    const/4 v12, 0x1

    goto :goto_136

    :cond_135
    const/4 v12, 0x0

    .line 52
    :goto_136
    sget-object v14, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-eq v4, v14, :cond_141

    sget-object v14, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-ne v4, v14, :cond_13f

    goto :goto_141

    :cond_13f
    const/4 v4, 0x0

    goto :goto_142

    :cond_141
    :goto_141
    const/4 v4, 0x1

    .line 53
    :goto_142
    sget-object v14, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-eq v3, v14, :cond_14d

    sget-object v14, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-ne v3, v14, :cond_14b

    goto :goto_14d

    :cond_14b
    const/4 v3, 0x0

    goto :goto_14e

    :cond_14d
    :goto_14d
    const/4 v3, 0x1

    :goto_14e
    const/4 v14, 0x0

    if-eqz v8, :cond_159

    .line 54
    iget v13, v1, Lb/f/b/k/e;->P:F

    cmpl-float v13, v13, v14

    if-lez v13, :cond_159

    const/4 v13, 0x1

    goto :goto_15a

    :cond_159
    const/4 v13, 0x0

    :goto_15a
    if-eqz v12, :cond_164

    .line 55
    iget v5, v1, Lb/f/b/k/e;->P:F

    cmpl-float v5, v5, v14

    if-lez v5, :cond_164

    const/4 v5, 0x1

    goto :goto_165

    :cond_164
    const/4 v5, 0x0

    .line 56
    :goto_165
    invoke-virtual {v10}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v14

    check-cast v14, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    .line 57
    iget-boolean v15, v2, Lb/f/b/k/n/b$a;->j:Z

    if-nez v15, :cond_184

    if-eqz v8, :cond_184

    iget v8, v1, Lb/f/b/k/e;->j:I

    if-nez v8, :cond_184

    if-eqz v12, :cond_184

    iget v8, v1, Lb/f/b/k/e;->k:I

    if-eqz v8, :cond_17c

    goto :goto_184

    :cond_17c
    const/4 v0, 0x0

    const/4 v3, 0x0

    const/4 v4, -0x1

    const/4 v15, 0x0

    const/16 v16, 0x0

    goto/16 :goto_237

    .line 58
    :cond_184
    :goto_184
    instance-of v8, v10, Landroidx/constraintlayout/widget/VirtualLayout;

    if-eqz v8, :cond_196

    instance-of v8, v1, Lb/f/b/k/l;

    if-eqz v8, :cond_196

    .line 59
    move-object v8, v1

    check-cast v8, Lb/f/b/k/l;

    .line 60
    move-object v12, v10

    check-cast v12, Landroidx/constraintlayout/widget/VirtualLayout;

    invoke-virtual {v12, v8, v6, v11}, Landroidx/constraintlayout/widget/VirtualLayout;->a(Lb/f/b/k/l;II)V

    goto :goto_199

    .line 61
    :cond_196
    invoke-virtual {v10, v6, v11}, Landroid/view/View;->measure(II)V

    .line 62
    :goto_199
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    .line 63
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    move-result v12

    .line 64
    invoke-virtual {v10}, Landroid/view/View;->getBaseline()I

    move-result v15

    if-eqz v9, :cond_1b2

    .line 65
    iget-object v9, v1, Lb/f/b/k/e;->g:[I

    const/16 v16, 0x0

    aput v8, v9, v16

    const/16 v18, 0x2

    .line 66
    aput v12, v9, v18

    goto :goto_1bc

    :cond_1b2
    const/16 v16, 0x0

    const/16 v18, 0x2

    .line 67
    iget-object v9, v1, Lb/f/b/k/e;->g:[I

    aput v16, v9, v16

    .line 68
    aput v16, v9, v18

    :goto_1bc
    if-eqz v7, :cond_1c8

    .line 69
    iget-object v7, v1, Lb/f/b/k/e;->g:[I

    const/4 v9, 0x1

    aput v12, v7, v9

    const/16 v17, 0x3

    .line 70
    aput v8, v7, v17

    goto :goto_1d1

    :cond_1c8
    const/4 v9, 0x1

    const/16 v17, 0x3

    .line 71
    iget-object v7, v1, Lb/f/b/k/e;->g:[I

    aput v16, v7, v9

    .line 72
    aput v16, v7, v17

    .line 73
    :goto_1d1
    iget v7, v1, Lb/f/b/k/e;->m:I

    if-lez v7, :cond_1da

    .line 74
    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    goto :goto_1db

    :cond_1da
    move v7, v8

    .line 75
    :goto_1db
    iget v9, v1, Lb/f/b/k/e;->n:I

    if-lez v9, :cond_1e3

    .line 76
    invoke-static {v9, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 77
    :cond_1e3
    iget v9, v1, Lb/f/b/k/e;->p:I

    if-lez v9, :cond_1ec

    .line 78
    invoke-static {v9, v12}, Ljava/lang/Math;->max(II)I

    move-result v9

    goto :goto_1ed

    :cond_1ec
    move v9, v12

    .line 79
    :goto_1ed
    iget v0, v1, Lb/f/b/k/e;->q:I

    if-lez v0, :cond_1f5

    .line 80
    invoke-static {v0, v9}, Ljava/lang/Math;->min(II)I

    move-result v9

    :cond_1f5
    const/high16 v0, 0x3f000000    # 0.5f

    if-eqz v13, :cond_204

    if-eqz v4, :cond_204

    .line 81
    iget v3, v1, Lb/f/b/k/e;->P:F

    int-to-float v4, v9

    mul-float v4, v4, v3

    add-float/2addr v4, v0

    float-to-int v0, v4

    move v7, v0

    goto :goto_20f

    :cond_204
    if-eqz v5, :cond_20f

    if-eqz v3, :cond_20f

    .line 82
    iget v3, v1, Lb/f/b/k/e;->P:F

    int-to-float v4, v7

    div-float/2addr v4, v3

    add-float/2addr v4, v0

    float-to-int v0, v4

    move v9, v0

    :cond_20f
    :goto_20f
    if-ne v8, v7, :cond_218

    if-eq v12, v9, :cond_214

    goto :goto_218

    :cond_214
    move v0, v7

    move v3, v9

    :goto_216
    const/4 v4, -0x1

    goto :goto_237

    :cond_218
    :goto_218
    const/high16 v0, 0x40000000    # 2.0f

    if-eq v8, v7, :cond_220

    .line 83
    invoke-static {v7, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    :cond_220
    if-eq v12, v9, :cond_226

    .line 84
    invoke-static {v9, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v11

    .line 85
    :cond_226
    invoke-virtual {v10, v6, v11}, Landroid/view/View;->measure(II)V

    .line 86
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    .line 87
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    .line 88
    invoke-virtual {v10}, Landroid/view/View;->getBaseline()I

    move-result v4

    move v15, v4

    goto :goto_216

    :goto_237
    if-eq v15, v4, :cond_23b

    const/4 v4, 0x1

    goto :goto_23c

    :cond_23b
    const/4 v4, 0x0

    .line 89
    :goto_23c
    iget v5, v2, Lb/f/b/k/n/b$a;->c:I

    if-ne v0, v5, :cond_247

    iget v5, v2, Lb/f/b/k/n/b$a;->d:I

    if-eq v3, v5, :cond_245

    goto :goto_247

    :cond_245
    const/4 v5, 0x0

    goto :goto_248

    :cond_247
    :goto_247
    const/4 v5, 0x1

    :goto_248
    iput-boolean v5, v2, Lb/f/b/k/n/b$a;->i:Z

    .line 90
    iget-boolean v5, v14, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->X:Z

    if-eqz v5, :cond_250

    const/4 v9, 0x1

    goto :goto_251

    :cond_250
    move v9, v4

    :goto_251
    if-eqz v9, :cond_25f

    const/4 v4, -0x1

    if-eq v15, v4, :cond_25f

    .line 91
    invoke-virtual/range {p1 .. p1}, Lb/f/b/k/e;->e()I

    move-result v1

    if-eq v1, v15, :cond_25f

    const/4 v1, 0x1

    .line 92
    iput-boolean v1, v2, Lb/f/b/k/n/b$a;->i:Z

    .line 93
    :cond_25f
    iput v0, v2, Lb/f/b/k/n/b$a;->e:I

    .line 94
    iput v3, v2, Lb/f/b/k/n/b$a;->f:I

    .line 95
    iput-boolean v9, v2, Lb/f/b/k/n/b$a;->h:Z

    .line 96
    iput v15, v2, Lb/f/b/k/n/b$a;->g:I

    return-void
.end method
