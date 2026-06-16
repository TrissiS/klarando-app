.class public Lb/f/b/k/n/k;
.super Ljava/lang/Object;
.source "RunGroup.java"


# static fields
.field public static d:I


# instance fields
.field public a:Z

.field public b:Lb/f/b/k/n/m;

.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/f/b/k/n/m;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lb/f/b/k/n/m;I)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p2, 0x0

    .line 2
    iput-object p2, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    .line 3
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lb/f/b/k/n/k;->c:Ljava/util/ArrayList;

    .line 4
    sget p2, Lb/f/b/k/n/k;->d:I

    add-int/lit8 p2, p2, 0x1

    .line 5
    sput p2, Lb/f/b/k/n/k;->d:I

    .line 6
    iput-object p1, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    return-void
.end method


# virtual methods
.method public a(Lb/f/b/k/f;I)J
    .registers 14

    .line 14
    iget-object v0, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    instance-of v1, v0, Lb/f/b/k/n/c;

    const-wide/16 v2, 0x0

    if-eqz v1, :cond_f

    .line 15
    check-cast v0, Lb/f/b/k/n/c;

    .line 16
    iget v0, v0, Lb/f/b/k/n/m;->f:I

    if-eq v0, p2, :cond_1b

    return-wide v2

    :cond_f
    if-nez p2, :cond_16

    .line 17
    instance-of v0, v0, Lb/f/b/k/n/j;

    if-nez v0, :cond_1b

    return-wide v2

    .line 18
    :cond_16
    instance-of v0, v0, Lb/f/b/k/n/l;

    if-nez v0, :cond_1b

    return-wide v2

    :cond_1b
    if-nez p2, :cond_20

    .line 19
    iget-object v0, p1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    goto :goto_22

    :cond_20
    iget-object v0, p1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    :goto_22
    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    if-nez p2, :cond_29

    .line 20
    iget-object p1, p1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    goto :goto_2b

    :cond_29
    iget-object p1, p1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    :goto_2b
    iget-object p1, p1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    .line 21
    iget-object v1, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    iget-object v1, v1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v1, v1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    .line 22
    iget-object v1, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    iget-object v1, v1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, v1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    .line 23
    iget-object v1, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    invoke-virtual {v1}, Lb/f/b/k/n/m;->d()J

    move-result-wide v4

    if-eqz v0, :cond_ad

    if-eqz p1, :cond_ad

    .line 24
    iget-object p1, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    iget-object p1, p1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {p0, p1, v2, v3}, Lb/f/b/k/n/k;->b(Lb/f/b/k/n/f;J)J

    move-result-wide v0

    .line 25
    iget-object p1, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    iget-object p1, p1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {p0, p1, v2, v3}, Lb/f/b/k/n/k;->a(Lb/f/b/k/n/f;J)J

    move-result-wide v6

    sub-long/2addr v0, v4

    .line 26
    iget-object p1, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    iget-object p1, p1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget p1, p1, Lb/f/b/k/n/f;->f:I

    neg-int v8, p1

    int-to-long v8, v8

    cmp-long v10, v0, v8

    if-ltz v10, :cond_6a

    int-to-long v8, p1

    add-long/2addr v0, v8

    :cond_6a
    neg-long v6, v6

    sub-long/2addr v6, v4

    .line 27
    iget-object p1, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    iget-object p1, p1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget p1, p1, Lb/f/b/k/n/f;->f:I

    int-to-long v8, p1

    sub-long/2addr v6, v8

    int-to-long v8, p1

    cmp-long v10, v6, v8

    if-ltz v10, :cond_7b

    int-to-long v8, p1

    sub-long/2addr v6, v8

    .line 28
    :cond_7b
    iget-object p1, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    iget-object p1, p1, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {p1, p2}, Lb/f/b/k/e;->a(I)F

    move-result p1

    const/4 p2, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    cmpl-float p2, p1, p2

    if-lez p2, :cond_92

    long-to-float p2, v6

    div-float/2addr p2, p1

    long-to-float v0, v0

    sub-float v1, v8, p1

    div-float/2addr v0, v1

    add-float/2addr p2, v0

    float-to-long v2, p2

    :cond_92
    long-to-float p2, v2

    mul-float v0, p2, p1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-long v2, v0

    sub-float/2addr v8, p1

    mul-float p2, p2, v8

    add-float/2addr p2, v1

    float-to-long p1, p2

    add-long/2addr v2, v4

    add-long/2addr v2, p1

    .line 29
    iget-object p1, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    iget-object p2, p1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget p2, p2, Lb/f/b/k/n/f;->f:I

    int-to-long v0, p2

    add-long/2addr v0, v2

    iget-object p1, p1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget p1, p1, Lb/f/b/k/n/f;->f:I

    goto :goto_f5

    :cond_ad
    if-eqz v0, :cond_c7

    .line 30
    iget-object p1, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    iget-object p1, p1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget p2, p1, Lb/f/b/k/n/f;->f:I

    int-to-long v0, p2

    invoke-virtual {p0, p1, v0, v1}, Lb/f/b/k/n/k;->b(Lb/f/b/k/n/f;J)J

    move-result-wide p1

    .line 31
    iget-object v0, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->f:I

    int-to-long v0, v0

    add-long/2addr v0, v4

    .line 32
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    goto :goto_f7

    :cond_c7
    if-eqz p1, :cond_e3

    .line 33
    iget-object p1, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    iget-object p1, p1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget p2, p1, Lb/f/b/k/n/f;->f:I

    int-to-long v0, p2

    invoke-virtual {p0, p1, v0, v1}, Lb/f/b/k/n/k;->a(Lb/f/b/k/n/f;J)J

    move-result-wide p1

    .line 34
    iget-object v0, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->f:I

    neg-int v0, v0

    int-to-long v0, v0

    add-long/2addr v0, v4

    neg-long p1, p1

    .line 35
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    goto :goto_f7

    .line 36
    :cond_e3
    iget-object p1, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    iget-object p2, p1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget p2, p2, Lb/f/b/k/n/f;->f:I

    int-to-long v0, p2

    invoke-virtual {p1}, Lb/f/b/k/n/m;->d()J

    move-result-wide p1

    add-long/2addr v0, p1

    iget-object p1, p0, Lb/f/b/k/n/k;->b:Lb/f/b/k/n/m;

    iget-object p1, p1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget p1, p1, Lb/f/b/k/n/f;->f:I

    :goto_f5
    int-to-long p1, p1

    sub-long/2addr v0, p1

    :goto_f7
    return-wide v0
.end method

.method public final a(Lb/f/b/k/n/f;J)J
    .registers 12

    .line 2
    iget-object v0, p1, Lb/f/b/k/n/f;->d:Lb/f/b/k/n/m;

    .line 3
    instance-of v1, v0, Lb/f/b/k/n/i;

    if-eqz v1, :cond_7

    return-wide p2

    .line 4
    :cond_7
    iget-object v1, p1, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    move-wide v3, p2

    :goto_f
    if-ge v2, v1, :cond_33

    .line 5
    iget-object v5, p1, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/f/b/k/n/d;

    .line 6
    instance-of v6, v5, Lb/f/b/k/n/f;

    if-eqz v6, :cond_30

    .line 7
    check-cast v5, Lb/f/b/k/n/f;

    .line 8
    iget-object v6, v5, Lb/f/b/k/n/f;->d:Lb/f/b/k/n/m;

    if-ne v6, v0, :cond_24

    goto :goto_30

    .line 9
    :cond_24
    iget v6, v5, Lb/f/b/k/n/f;->f:I

    int-to-long v6, v6

    add-long/2addr v6, p2

    invoke-virtual {p0, v5, v6, v7}, Lb/f/b/k/n/k;->a(Lb/f/b/k/n/f;J)J

    move-result-wide v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    :cond_30
    :goto_30
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 10
    :cond_33
    iget-object v1, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    if-ne p1, v1, :cond_50

    .line 11
    invoke-virtual {v0}, Lb/f/b/k/n/m;->d()J

    move-result-wide v1

    .line 12
    iget-object p1, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    sub-long/2addr p2, v1

    invoke-virtual {p0, p1, p2, p3}, Lb/f/b/k/n/k;->a(Lb/f/b/k/n/f;J)J

    move-result-wide v1

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    .line 13
    iget-object p1, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget p1, p1, Lb/f/b/k/n/f;->f:I

    int-to-long v3, p1

    sub-long/2addr p2, v3

    invoke-static {v1, v2, p2, p3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    :cond_50
    return-wide v3
.end method

.method public a(Lb/f/b/k/n/m;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/n/k;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(Lb/f/b/k/n/f;J)J
    .registers 12

    .line 1
    iget-object v0, p1, Lb/f/b/k/n/f;->d:Lb/f/b/k/n/m;

    .line 2
    instance-of v1, v0, Lb/f/b/k/n/i;

    if-eqz v1, :cond_7

    return-wide p2

    .line 3
    :cond_7
    iget-object v1, p1, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    move-wide v3, p2

    :goto_f
    if-ge v2, v1, :cond_33

    .line 4
    iget-object v5, p1, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/f/b/k/n/d;

    .line 5
    instance-of v6, v5, Lb/f/b/k/n/f;

    if-eqz v6, :cond_30

    .line 6
    check-cast v5, Lb/f/b/k/n/f;

    .line 7
    iget-object v6, v5, Lb/f/b/k/n/f;->d:Lb/f/b/k/n/m;

    if-ne v6, v0, :cond_24

    goto :goto_30

    .line 8
    :cond_24
    iget v6, v5, Lb/f/b/k/n/f;->f:I

    int-to-long v6, v6

    add-long/2addr v6, p2

    invoke-virtual {p0, v5, v6, v7}, Lb/f/b/k/n/k;->b(Lb/f/b/k/n/f;J)J

    move-result-wide v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    :cond_30
    :goto_30
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 9
    :cond_33
    iget-object v1, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    if-ne p1, v1, :cond_50

    .line 10
    invoke-virtual {v0}, Lb/f/b/k/n/m;->d()J

    move-result-wide v1

    .line 11
    iget-object p1, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    add-long/2addr p2, v1

    invoke-virtual {p0, p1, p2, p3}, Lb/f/b/k/n/k;->b(Lb/f/b/k/n/f;J)J

    move-result-wide v1

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    .line 12
    iget-object p1, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget p1, p1, Lb/f/b/k/n/f;->f:I

    int-to-long v3, p1

    sub-long/2addr p2, v3

    invoke-static {v1, v2, p2, p3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    :cond_50
    return-wide v3
.end method
