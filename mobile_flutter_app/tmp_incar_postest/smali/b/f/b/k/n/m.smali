.class public abstract Lb/f/b/k/n/m;
.super Ljava/lang/Object;
.source "WidgetRun.java"

# interfaces
.implements Lb/f/b/k/n/d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/b/k/n/m$b;
    }
.end annotation


# instance fields
.field public a:I

.field public b:Lb/f/b/k/e;

.field public c:Lb/f/b/k/n/k;

.field public d:Lb/f/b/k/e$b;

.field public e:Lb/f/b/k/n/g;

.field public f:I

.field public g:Z

.field public h:Lb/f/b/k/n/f;

.field public i:Lb/f/b/k/n/f;

.field public j:Lb/f/b/k/n/m$b;


# direct methods
.method public constructor <init>(Lb/f/b/k/e;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lb/f/b/k/n/g;

    invoke-direct {v0, p0}, Lb/f/b/k/n/g;-><init>(Lb/f/b/k/n/m;)V

    iput-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Lb/f/b/k/n/m;->f:I

    .line 4
    iput-boolean v0, p0, Lb/f/b/k/n/m;->g:Z

    .line 5
    new-instance v0, Lb/f/b/k/n/f;

    invoke-direct {v0, p0}, Lb/f/b/k/n/f;-><init>(Lb/f/b/k/n/m;)V

    iput-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    .line 6
    new-instance v0, Lb/f/b/k/n/f;

    invoke-direct {v0, p0}, Lb/f/b/k/n/f;-><init>(Lb/f/b/k/n/m;)V

    iput-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    .line 7
    sget-object v0, Lb/f/b/k/n/m$b;->NONE:Lb/f/b/k/n/m$b;

    iput-object v0, p0, Lb/f/b/k/n/m;->j:Lb/f/b/k/n/m$b;

    .line 8
    iput-object p1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    return-void
.end method


# virtual methods
.method public final a(II)I
    .registers 4

    if-nez p2, :cond_15

    .line 33
    iget-object p2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget v0, p2, Lb/f/b/k/e;->n:I

    .line 34
    iget p2, p2, Lb/f/b/k/e;->m:I

    .line 35
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    move-result p2

    if-lez v0, :cond_12

    .line 36
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p2

    :cond_12
    if-eq p2, p1, :cond_28

    goto :goto_27

    .line 37
    :cond_15
    iget-object p2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget v0, p2, Lb/f/b/k/e;->q:I

    .line 38
    iget p2, p2, Lb/f/b/k/e;->p:I

    .line 39
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    move-result p2

    if-lez v0, :cond_25

    .line 40
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p2

    :cond_25
    if-eq p2, p1, :cond_28

    :goto_27
    move p1, p2

    :cond_28
    return p1
.end method

.method public final a(Lb/f/b/k/d;)Lb/f/b/k/n/f;
    .registers 5

    .line 1
    iget-object p1, p1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    const/4 v0, 0x0

    if-nez p1, :cond_6

    return-object v0

    .line 2
    :cond_6
    iget-object v1, p1, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    .line 3
    iget-object p1, p1, Lb/f/b/k/d;->c:Lb/f/b/k/d$b;

    .line 4
    sget-object v2, Lb/f/b/k/n/m$a;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v2, p1

    const/4 v2, 0x1

    if-eq p1, v2, :cond_36

    const/4 v2, 0x2

    if-eq p1, v2, :cond_31

    const/4 v2, 0x3

    if-eq p1, v2, :cond_2c

    const/4 v2, 0x4

    if-eq p1, v2, :cond_27

    const/4 v2, 0x5

    if-eq p1, v2, :cond_22

    goto :goto_3a

    .line 5
    :cond_22
    iget-object p1, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    .line 6
    iget-object v0, p1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    goto :goto_3a

    .line 7
    :cond_27
    iget-object p1, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    .line 8
    iget-object v0, p1, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    goto :goto_3a

    .line 9
    :cond_2c
    iget-object p1, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    .line 10
    iget-object v0, p1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    goto :goto_3a

    .line 11
    :cond_31
    iget-object p1, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    .line 12
    iget-object v0, p1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    goto :goto_3a

    .line 13
    :cond_36
    iget-object p1, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    .line 14
    iget-object v0, p1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    :goto_3a
    return-object v0
.end method

.method public final a(Lb/f/b/k/d;I)Lb/f/b/k/n/f;
    .registers 5

    .line 41
    iget-object v0, p1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return-object v1

    .line 42
    :cond_6
    iget-object v0, v0, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    if-nez p2, :cond_d

    .line 43
    iget-object p2, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    goto :goto_f

    :cond_d
    iget-object p2, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    .line 44
    :goto_f
    iget-object p1, p1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    iget-object p1, p1, Lb/f/b/k/d;->c:Lb/f/b/k/d$b;

    .line 45
    sget-object v0, Lb/f/b/k/n/m$a;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2b

    const/4 v0, 0x2

    if-eq p1, v0, :cond_28

    const/4 v0, 0x3

    if-eq p1, v0, :cond_2b

    const/4 v0, 0x5

    if-eq p1, v0, :cond_28

    goto :goto_2d

    .line 46
    :cond_28
    iget-object v1, p2, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    goto :goto_2d

    .line 47
    :cond_2b
    iget-object v1, p2, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    :goto_2d
    return-object v1
.end method

.method public abstract a()V
.end method

.method public a(Lb/f/b/k/n/d;)V
    .registers 2

    return-void
.end method

.method public a(Lb/f/b/k/n/d;Lb/f/b/k/d;Lb/f/b/k/d;I)V
    .registers 9

    .line 15
    invoke-virtual {p0, p2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object p1

    .line 16
    invoke-virtual {p0, p3}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v0

    .line 17
    iget-boolean v1, p1, Lb/f/b/k/n/f;->j:Z

    if-eqz v1, :cond_7d

    iget-boolean v1, v0, Lb/f/b/k/n/f;->j:Z

    if-nez v1, :cond_11

    goto :goto_7d

    .line 18
    :cond_11
    iget v1, p1, Lb/f/b/k/n/f;->g:I

    invoke-virtual {p2}, Lb/f/b/k/d;->a()I

    move-result p2

    add-int/2addr v1, p2

    .line 19
    iget p2, v0, Lb/f/b/k/n/f;->g:I

    invoke-virtual {p3}, Lb/f/b/k/d;->a()I

    move-result p3

    sub-int/2addr p2, p3

    sub-int p3, p2, v1

    .line 20
    iget-object v2, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v2, v2, Lb/f/b/k/n/f;->j:Z

    if-nez v2, :cond_30

    iget-object v2, p0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v3, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v2, v3, :cond_30

    .line 21
    invoke-virtual {p0, p4, p3}, Lb/f/b/k/n/m;->b(II)V

    .line 22
    :cond_30
    iget-object v2, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v3, v2, Lb/f/b/k/n/f;->j:Z

    if-nez v3, :cond_37

    return-void

    .line 23
    :cond_37
    iget v2, v2, Lb/f/b/k/n/f;->g:I

    if-ne v2, p3, :cond_46

    .line 24
    iget-object p1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {p1, v1}, Lb/f/b/k/n/f;->a(I)V

    .line 25
    iget-object p1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {p1, p2}, Lb/f/b/k/n/f;->a(I)V

    return-void

    .line 26
    :cond_46
    iget-object p3, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    if-nez p4, :cond_4f

    invoke-virtual {p3}, Lb/f/b/k/e;->l()F

    move-result p3

    goto :goto_53

    .line 27
    :cond_4f
    invoke-virtual {p3}, Lb/f/b/k/e;->v()F

    move-result p3

    :goto_53
    const/high16 p4, 0x3f000000    # 0.5f

    if-ne p1, v0, :cond_5d

    .line 28
    iget v1, p1, Lb/f/b/k/n/f;->g:I

    .line 29
    iget p2, v0, Lb/f/b/k/n/f;->g:I

    const/high16 p3, 0x3f000000    # 0.5f

    :cond_5d
    sub-int/2addr p2, v1

    .line 30
    iget-object p1, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget p1, p1, Lb/f/b/k/n/f;->g:I

    sub-int/2addr p2, p1

    .line 31
    iget-object p1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    int-to-float v0, v1

    add-float/2addr v0, p4

    int-to-float p2, p2

    mul-float p2, p2, p3

    add-float/2addr v0, p2

    float-to-int p2, v0

    invoke-virtual {p1, p2}, Lb/f/b/k/n/f;->a(I)V

    .line 32
    iget-object p1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object p2, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget p2, p2, Lb/f/b/k/n/f;->g:I

    iget-object p3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget p3, p3, Lb/f/b/k/n/f;->g:I

    add-int/2addr p2, p3

    invoke-virtual {p1, p2}, Lb/f/b/k/n/f;->a(I)V

    :cond_7d
    :goto_7d
    return-void
.end method

.method public final a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V
    .registers 5

    .line 48
    iget-object v0, p1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    iput p3, p1, Lb/f/b/k/n/f;->f:I

    .line 50
    iget-object p2, p2, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;ILb/f/b/k/n/g;)V
    .registers 7

    .line 51
    iget-object v0, p1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    iget-object v0, p1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    iget-object v1, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    iput p3, p1, Lb/f/b/k/n/f;->h:I

    .line 54
    iput-object p4, p1, Lb/f/b/k/n/f;->i:Lb/f/b/k/n/g;

    .line 55
    iget-object p2, p2, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    iget-object p2, p4, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public abstract b()V
.end method

.method public final b(II)V
    .registers 9

    .line 1
    iget v0, p0, Lb/f/b/k/n/m;->a:I

    if-eqz v0, :cond_9d

    const/4 v1, 0x1

    if-eq v0, v1, :cond_8b

    const/4 p2, 0x2

    const/high16 v2, 0x3f000000    # 0.5f

    if-eq v0, p2, :cond_5a

    const/4 p2, 0x3

    if-eq v0, p2, :cond_11

    goto/16 :goto_a6

    .line 2
    :cond_11
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v4, v3, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v5, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v4, v5, :cond_2b

    iget v3, v3, Lb/f/b/k/n/m;->a:I

    if-ne v3, p2, :cond_2b

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v3, v0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    if-ne v3, v5, :cond_2b

    iget v0, v0, Lb/f/b/k/n/m;->a:I

    if-ne v0, p2, :cond_2b

    goto/16 :goto_a6

    .line 3
    :cond_2b
    iget-object p2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    if-nez p1, :cond_32

    iget-object p2, p2, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    goto :goto_34

    :cond_32
    iget-object p2, p2, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    .line 4
    :goto_34
    iget-object v0, p2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    if-eqz v0, :cond_a6

    .line 5
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->i()F

    move-result v0

    if-ne p1, v1, :cond_4b

    .line 6
    iget-object p1, p2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget p1, p1, Lb/f/b/k/n/f;->g:I

    int-to-float p1, p1

    div-float/2addr p1, v0

    add-float/2addr p1, v2

    float-to-int p1, p1

    goto :goto_54

    .line 7
    :cond_4b
    iget-object p1, p2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget p1, p1, Lb/f/b/k/n/f;->g:I

    int-to-float p1, p1

    mul-float v0, v0, p1

    add-float/2addr v0, v2

    float-to-int p1, v0

    .line 8
    :goto_54
    iget-object p2, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {p2, p1}, Lb/f/b/k/n/g;->a(I)V

    goto :goto_a6

    .line 9
    :cond_5a
    iget-object p2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {p2}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object p2

    if-eqz p2, :cond_a6

    if-nez p1, :cond_67

    .line 10
    iget-object p2, p2, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    goto :goto_69

    :cond_67
    iget-object p2, p2, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    .line 11
    :goto_69
    iget-object v0, p2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    if-eqz v0, :cond_a6

    .line 12
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    if-nez p1, :cond_76

    iget v0, v0, Lb/f/b/k/e;->o:F

    goto :goto_78

    :cond_76
    iget v0, v0, Lb/f/b/k/e;->r:F

    .line 13
    :goto_78
    iget-object p2, p2, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget p2, p2, Lb/f/b/k/n/f;->g:I

    int-to-float p2, p2

    mul-float p2, p2, v0

    add-float/2addr p2, v2

    float-to-int p2, p2

    .line 14
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {p0, p2, p1}, Lb/f/b/k/n/m;->a(II)I

    move-result p1

    invoke-virtual {v0, p1}, Lb/f/b/k/n/g;->a(I)V

    goto :goto_a6

    .line 15
    :cond_8b
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v0, v0, Lb/f/b/k/n/g;->m:I

    invoke-virtual {p0, v0, p1}, Lb/f/b/k/n/m;->a(II)I

    move-result p1

    .line 16
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {v0, p1}, Lb/f/b/k/n/g;->a(I)V

    goto :goto_a6

    .line 17
    :cond_9d
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {p0, p2, p1}, Lb/f/b/k/n/m;->a(II)I

    move-result p1

    invoke-virtual {v0, p1}, Lb/f/b/k/n/g;->a(I)V

    :cond_a6
    :goto_a6
    return-void
.end method

.method public b(Lb/f/b/k/n/d;)V
    .registers 2

    return-void
.end method

.method public abstract c()V
.end method

.method public c(Lb/f/b/k/n/d;)V
    .registers 2

    return-void
.end method

.method public d()J
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v1, v0, Lb/f/b/k/n/f;->j:Z

    if-eqz v1, :cond_a

    .line 2
    iget v0, v0, Lb/f/b/k/n/f;->g:I

    int-to-long v0, v0

    return-wide v0

    :cond_a
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public e()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/f/b/k/n/m;->g:Z

    return v0
.end method

.method public abstract f()Z
.end method
