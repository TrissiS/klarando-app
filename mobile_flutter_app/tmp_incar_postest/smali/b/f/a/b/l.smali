.class public Lb/f/a/b/l;
.super Lb/f/a/b/c;
.source "KeyTrigger.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/a/b/l$a;
    }
.end annotation


# instance fields
.field public f:Ljava/lang/String;

.field public g:I

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:I

.field public k:I

.field public l:Landroid/view/View;

.field public m:F

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:F

.field public r:Ljava/lang/reflect/Method;

.field public s:Ljava/lang/reflect/Method;

.field public t:Ljava/lang/reflect/Method;

.field public u:F

.field public v:Z

.field public w:Landroid/graphics/RectF;

.field public x:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Lb/f/a/b/c;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lb/f/a/b/l;->f:Ljava/lang/String;

    .line 3
    sget v1, Lb/f/a/b/c;->e:I

    iput v1, p0, Lb/f/a/b/l;->g:I

    .line 4
    iput-object v0, p0, Lb/f/a/b/l;->h:Ljava/lang/String;

    .line 5
    iput-object v0, p0, Lb/f/a/b/l;->i:Ljava/lang/String;

    .line 6
    iput v1, p0, Lb/f/a/b/l;->j:I

    .line 7
    iput v1, p0, Lb/f/a/b/l;->k:I

    .line 8
    iput-object v0, p0, Lb/f/a/b/l;->l:Landroid/view/View;

    const v0, 0x3dcccccd    # 0.1f

    .line 9
    iput v0, p0, Lb/f/a/b/l;->m:F

    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lb/f/a/b/l;->n:Z

    .line 11
    iput-boolean v0, p0, Lb/f/a/b/l;->o:Z

    .line 12
    iput-boolean v0, p0, Lb/f/a/b/l;->p:Z

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 13
    iput v0, p0, Lb/f/a/b/l;->q:F

    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lb/f/a/b/l;->v:Z

    .line 15
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lb/f/a/b/l;->w:Landroid/graphics/RectF;

    .line 16
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lb/f/a/b/l;->x:Landroid/graphics/RectF;

    .line 17
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    return-void
.end method

.method public static synthetic a(Lb/f/a/b/l;F)F
    .registers 2

    .line 1
    iput p1, p0, Lb/f/a/b/l;->q:F

    return p1
.end method

.method public static synthetic a(Lb/f/a/b/l;)I
    .registers 1

    .line 3
    iget p0, p0, Lb/f/a/b/l;->j:I

    return p0
.end method

.method public static synthetic a(Lb/f/a/b/l;I)I
    .registers 2

    .line 4
    iput p1, p0, Lb/f/a/b/l;->j:I

    return p1
.end method

.method public static synthetic a(Lb/f/a/b/l;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 2
    iput-object p1, p0, Lb/f/a/b/l;->h:Ljava/lang/String;

    return-object p1
.end method

.method public static synthetic a(Lb/f/a/b/l;Z)Z
    .registers 2

    .line 5
    iput-boolean p1, p0, Lb/f/a/b/l;->v:Z

    return p1
.end method

.method public static synthetic b(Lb/f/a/b/l;)I
    .registers 1

    .line 2
    iget p0, p0, Lb/f/a/b/l;->k:I

    return p0
.end method

.method public static synthetic b(Lb/f/a/b/l;I)I
    .registers 2

    .line 3
    iput p1, p0, Lb/f/a/b/l;->k:I

    return p1
.end method

.method public static synthetic b(Lb/f/a/b/l;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 1
    iput-object p1, p0, Lb/f/a/b/l;->i:Ljava/lang/String;

    return-object p1
.end method

.method public static synthetic c(Lb/f/a/b/l;I)I
    .registers 2

    .line 3
    iput p1, p0, Lb/f/a/b/l;->g:I

    return p1
.end method

.method public static synthetic c(Lb/f/a/b/l;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 1
    iput-object p1, p0, Lb/f/a/b/l;->f:Ljava/lang/String;

    return-object p1
.end method

.method public static synthetic c(Lb/f/a/b/l;)Z
    .registers 1

    .line 2
    iget-boolean p0, p0, Lb/f/a/b/l;->v:Z

    return p0
.end method

.method public static synthetic d(Lb/f/a/b/l;)I
    .registers 1

    .line 1
    iget p0, p0, Lb/f/a/b/l;->g:I

    return p0
.end method


# virtual methods
.method public a(FLandroid/view/View;)V
    .registers 13

    .line 13
    iget v0, p0, Lb/f/a/b/l;->k:I

    sget v1, Lb/f/a/b/c;->e:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_62

    .line 14
    iget-object v0, p0, Lb/f/a/b/l;->l:Landroid/view/View;

    if-nez v0, :cond_1a

    .line 15
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget v1, p0, Lb/f/a/b/l;->k:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lb/f/a/b/l;->l:Landroid/view/View;

    .line 16
    :cond_1a
    iget-object v0, p0, Lb/f/a/b/l;->w:Landroid/graphics/RectF;

    iget-object v1, p0, Lb/f/a/b/l;->l:Landroid/view/View;

    iget-boolean v4, p0, Lb/f/a/b/l;->v:Z

    invoke-virtual {p0, v0, v1, v4}, Lb/f/a/b/l;->a(Landroid/graphics/RectF;Landroid/view/View;Z)V

    .line 17
    iget-object v0, p0, Lb/f/a/b/l;->x:Landroid/graphics/RectF;

    iget-boolean v1, p0, Lb/f/a/b/l;->v:Z

    invoke-virtual {p0, v0, p2, v1}, Lb/f/a/b/l;->a(Landroid/graphics/RectF;Landroid/view/View;Z)V

    .line 18
    iget-object v0, p0, Lb/f/a/b/l;->w:Landroid/graphics/RectF;

    iget-object v1, p0, Lb/f/a/b/l;->x:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->intersect(Landroid/graphics/RectF;)Z

    move-result v0

    if-eqz v0, :cond_4c

    .line 19
    iget-boolean v0, p0, Lb/f/a/b/l;->n:Z

    if-eqz v0, :cond_3c

    .line 20
    iput-boolean v3, p0, Lb/f/a/b/l;->n:Z

    const/4 v0, 0x1

    goto :goto_3d

    :cond_3c
    const/4 v0, 0x0

    .line 21
    :goto_3d
    iget-boolean v1, p0, Lb/f/a/b/l;->p:Z

    if-eqz v1, :cond_45

    .line 22
    iput-boolean v3, p0, Lb/f/a/b/l;->p:Z

    const/4 v1, 0x1

    goto :goto_46

    :cond_45
    const/4 v1, 0x0

    .line 23
    :goto_46
    iput-boolean v2, p0, Lb/f/a/b/l;->o:Z

    move v2, v1

    const/4 v1, 0x0

    goto/16 :goto_e0

    .line 24
    :cond_4c
    iget-boolean v0, p0, Lb/f/a/b/l;->n:Z

    if-nez v0, :cond_54

    .line 25
    iput-boolean v2, p0, Lb/f/a/b/l;->n:Z

    const/4 v0, 0x1

    goto :goto_55

    :cond_54
    const/4 v0, 0x0

    .line 26
    :goto_55
    iget-boolean v1, p0, Lb/f/a/b/l;->o:Z

    if-eqz v1, :cond_5d

    .line 27
    iput-boolean v3, p0, Lb/f/a/b/l;->o:Z

    const/4 v1, 0x1

    goto :goto_5e

    :cond_5d
    const/4 v1, 0x0

    .line 28
    :goto_5e
    iput-boolean v2, p0, Lb/f/a/b/l;->p:Z

    goto/16 :goto_df

    .line 29
    :cond_62
    iget-boolean v0, p0, Lb/f/a/b/l;->n:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_78

    .line 30
    iget v0, p0, Lb/f/a/b/l;->q:F

    sub-float v4, p1, v0

    .line 31
    iget v5, p0, Lb/f/a/b/l;->u:F

    sub-float/2addr v5, v0

    mul-float v4, v4, v5

    cmpg-float v0, v4, v1

    if-gez v0, :cond_88

    .line 32
    iput-boolean v3, p0, Lb/f/a/b/l;->n:Z

    const/4 v0, 0x1

    goto :goto_89

    .line 33
    :cond_78
    iget v0, p0, Lb/f/a/b/l;->q:F

    sub-float v0, p1, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v4, p0, Lb/f/a/b/l;->m:F

    cmpl-float v0, v0, v4

    if-lez v0, :cond_88

    .line 34
    iput-boolean v2, p0, Lb/f/a/b/l;->n:Z

    :cond_88
    const/4 v0, 0x0

    .line 35
    :goto_89
    iget-boolean v4, p0, Lb/f/a/b/l;->o:Z

    if-eqz v4, :cond_a2

    .line 36
    iget v4, p0, Lb/f/a/b/l;->q:F

    sub-float v5, p1, v4

    .line 37
    iget v6, p0, Lb/f/a/b/l;->u:F

    sub-float/2addr v6, v4

    mul-float v6, v6, v5

    cmpg-float v4, v6, v1

    if-gez v4, :cond_b2

    cmpg-float v4, v5, v1

    if-gez v4, :cond_b2

    .line 38
    iput-boolean v3, p0, Lb/f/a/b/l;->o:Z

    const/4 v4, 0x1

    goto :goto_b3

    .line 39
    :cond_a2
    iget v4, p0, Lb/f/a/b/l;->q:F

    sub-float v4, p1, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v5, p0, Lb/f/a/b/l;->m:F

    cmpl-float v4, v4, v5

    if-lez v4, :cond_b2

    .line 40
    iput-boolean v2, p0, Lb/f/a/b/l;->o:Z

    :cond_b2
    const/4 v4, 0x0

    .line 41
    :goto_b3
    iget-boolean v5, p0, Lb/f/a/b/l;->p:Z

    if-eqz v5, :cond_ce

    .line 42
    iget v5, p0, Lb/f/a/b/l;->q:F

    sub-float v6, p1, v5

    .line 43
    iget v7, p0, Lb/f/a/b/l;->u:F

    sub-float/2addr v7, v5

    mul-float v7, v7, v6

    cmpg-float v5, v7, v1

    if-gez v5, :cond_cb

    cmpl-float v1, v6, v1

    if-lez v1, :cond_cb

    .line 44
    iput-boolean v3, p0, Lb/f/a/b/l;->p:Z

    goto :goto_cc

    :cond_cb
    const/4 v2, 0x0

    :goto_cc
    move v1, v4

    goto :goto_e0

    .line 45
    :cond_ce
    iget v1, p0, Lb/f/a/b/l;->q:F

    sub-float v1, p1, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iget v5, p0, Lb/f/a/b/l;->m:F

    cmpl-float v1, v1, v5

    if-lez v1, :cond_de

    .line 46
    iput-boolean v2, p0, Lb/f/a/b/l;->p:Z

    :cond_de
    move v1, v4

    :goto_df
    const/4 v2, 0x0

    .line 47
    :goto_e0
    iput p1, p0, Lb/f/a/b/l;->u:F

    if-nez v1, :cond_e8

    if-nez v0, :cond_e8

    if-eqz v2, :cond_f3

    .line 48
    :cond_e8
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget v5, p0, Lb/f/a/b/l;->j:I

    invoke-virtual {v4, v5, v2, p1}, Landroidx/constraintlayout/motion/widget/MotionLayout;->a(IZF)V

    .line 49
    :cond_f3
    iget p1, p0, Lb/f/a/b/l;->g:I

    sget v4, Lb/f/a/b/c;->e:I

    if-ne p1, v4, :cond_fa

    goto :goto_106

    :cond_fa
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroidx/constraintlayout/motion/widget/MotionLayout;

    iget p2, p0, Lb/f/a/b/l;->g:I

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    :goto_106
    const-string p1, "Could not find method \""

    const-string v4, "Exception in call \""

    const-string v5, " "

    const-string v6, "\"on class "

    const-string v7, "KeyTrigger"

    if-eqz v1, :cond_189

    .line 50
    iget-object v1, p0, Lb/f/a/b/l;->h:Ljava/lang/String;

    if-eqz v1, :cond_189

    .line 51
    iget-object v1, p0, Lb/f/a/b/l;->s:Ljava/lang/reflect/Method;

    if-nez v1, :cond_155

    .line 52
    :try_start_11a
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    iget-object v8, p0, Lb/f/a/b/l;->h:Ljava/lang/String;

    new-array v9, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lb/f/a/b/l;->s:Ljava/lang/reflect/Method;
    :try_end_128
    .catch Ljava/lang/NoSuchMethodException; {:try_start_11a .. :try_end_128} :catch_129

    goto :goto_155

    .line 53
    :catch_129
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, p0, Lb/f/a/b/l;->h:Ljava/lang/String;

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lb/f/a/b/a;->a(Landroid/view/View;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 55
    invoke-static {v7, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    :cond_155
    :goto_155
    :try_start_155
    iget-object v1, p0, Lb/f/a/b/l;->s:Ljava/lang/reflect/Method;

    new-array v8, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p2, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_15c
    .catch Ljava/lang/Exception; {:try_start_155 .. :try_end_15c} :catch_15d

    goto :goto_189

    .line 57
    :catch_15d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, p0, Lb/f/a/b/l;->h:Ljava/lang/String;

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lb/f/a/b/a;->a(Landroid/view/View;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 59
    invoke-static {v7, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_189
    :goto_189
    if-eqz v2, :cond_202

    .line 60
    iget-object v1, p0, Lb/f/a/b/l;->i:Ljava/lang/String;

    if-eqz v1, :cond_202

    .line 61
    iget-object v1, p0, Lb/f/a/b/l;->t:Ljava/lang/reflect/Method;

    if-nez v1, :cond_1ce

    .line 62
    :try_start_193
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    iget-object v2, p0, Lb/f/a/b/l;->i:Ljava/lang/String;

    new-array v8, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lb/f/a/b/l;->t:Ljava/lang/reflect/Method;
    :try_end_1a1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_193 .. :try_end_1a1} :catch_1a2

    goto :goto_1ce

    .line 63
    :catch_1a2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lb/f/a/b/l;->i:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lb/f/a/b/a;->a(Landroid/view/View;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 65
    invoke-static {v7, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    :cond_1ce
    :goto_1ce
    :try_start_1ce
    iget-object v1, p0, Lb/f/a/b/l;->t:Ljava/lang/reflect/Method;

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p2, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1d5
    .catch Ljava/lang/Exception; {:try_start_1ce .. :try_end_1d5} :catch_1d6

    goto :goto_202

    .line 67
    :catch_1d6
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lb/f/a/b/l;->i:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lb/f/a/b/a;->a(Landroid/view/View;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 69
    invoke-static {v7, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_202
    :goto_202
    if-eqz v0, :cond_27b

    .line 70
    iget-object v0, p0, Lb/f/a/b/l;->f:Ljava/lang/String;

    if-eqz v0, :cond_27b

    .line 71
    iget-object v0, p0, Lb/f/a/b/l;->r:Ljava/lang/reflect/Method;

    if-nez v0, :cond_247

    .line 72
    :try_start_20c
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    iget-object v1, p0, Lb/f/a/b/l;->f:Ljava/lang/String;

    new-array v2, v3, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lb/f/a/b/l;->r:Ljava/lang/reflect/Method;
    :try_end_21a
    .catch Ljava/lang/NoSuchMethodException; {:try_start_20c .. :try_end_21a} :catch_21b

    goto :goto_247

    .line 73
    :catch_21b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lb/f/a/b/l;->f:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lb/f/a/b/a;->a(Landroid/view/View;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 75
    invoke-static {v7, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    :cond_247
    :goto_247
    :try_start_247
    iget-object p1, p0, Lb/f/a/b/l;->r:Ljava/lang/reflect/Method;

    new-array v0, v3, [Ljava/lang/Object;

    invoke-virtual {p1, p2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_24e
    .catch Ljava/lang/Exception; {:try_start_247 .. :try_end_24e} :catch_24f

    goto :goto_27b

    .line 77
    :catch_24f
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lb/f/a/b/l;->f:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lb/f/a/b/a;->a(Landroid/view/View;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 79
    invoke-static {v7, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_27b
    :goto_27b
    return-void
.end method

.method public a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 6
    sget-object v0, Lb/f/c/f;->KeyTrigger:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 7
    invoke-static {p0, p2, p1}, Lb/f/a/b/l$a;->a(Lb/f/a/b/l;Landroid/content/res/TypedArray;Landroid/content/Context;)V

    return-void
.end method

.method public final a(Landroid/graphics/RectF;Landroid/view/View;Z)V
    .registers 5

    .line 8
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v0

    int-to-float v0, v0

    iput v0, p1, Landroid/graphics/RectF;->top:F

    .line 9
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result v0

    int-to-float v0, v0

    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    .line 10
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v0

    int-to-float v0, v0

    iput v0, p1, Landroid/graphics/RectF;->left:F

    .line 11
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    move-result v0

    int-to-float v0, v0

    iput v0, p1, Landroid/graphics/RectF;->right:F

    if-eqz p3, :cond_25

    .line 12
    invoke-virtual {p2}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    :cond_25
    return-void
.end method

.method public a(Ljava/util/HashMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lb/f/a/b/r;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public a(Ljava/util/HashSet;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    return-void
.end method
