.class public Lb/f/b/k/g$a;
.super Ljava/lang/Object;
.source "Flow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/f/b/k/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:Lb/f/b/k/e;

.field public c:I

.field public d:Lb/f/b/k/d;

.field public e:Lb/f/b/k/d;

.field public f:Lb/f/b/k/d;

.field public g:Lb/f/b/k/d;

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public final synthetic r:Lb/f/b/k/g;


# direct methods
.method public constructor <init>(Lb/f/b/k/g;ILb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;I)V
    .registers 10

    .line 1
    iput-object p1, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lb/f/b/k/g$a;->a:I

    const/4 v1, 0x0

    .line 3
    iput-object v1, p0, Lb/f/b/k/g$a;->b:Lb/f/b/k/e;

    .line 4
    iput v0, p0, Lb/f/b/k/g$a;->c:I

    .line 5
    iput v0, p0, Lb/f/b/k/g$a;->h:I

    .line 6
    iput v0, p0, Lb/f/b/k/g$a;->i:I

    .line 7
    iput v0, p0, Lb/f/b/k/g$a;->j:I

    .line 8
    iput v0, p0, Lb/f/b/k/g$a;->k:I

    .line 9
    iput v0, p0, Lb/f/b/k/g$a;->l:I

    .line 10
    iput v0, p0, Lb/f/b/k/g$a;->m:I

    .line 11
    iput v0, p0, Lb/f/b/k/g$a;->n:I

    .line 12
    iput v0, p0, Lb/f/b/k/g$a;->o:I

    .line 13
    iput v0, p0, Lb/f/b/k/g$a;->p:I

    .line 14
    iput v0, p0, Lb/f/b/k/g$a;->q:I

    .line 15
    iput p2, p0, Lb/f/b/k/g$a;->a:I

    .line 16
    iput-object p3, p0, Lb/f/b/k/g$a;->d:Lb/f/b/k/d;

    .line 17
    iput-object p4, p0, Lb/f/b/k/g$a;->e:Lb/f/b/k/d;

    .line 18
    iput-object p5, p0, Lb/f/b/k/g$a;->f:Lb/f/b/k/d;

    .line 19
    iput-object p6, p0, Lb/f/b/k/g$a;->g:Lb/f/b/k/d;

    .line 20
    invoke-virtual {p1}, Lb/f/b/k/l;->N()I

    move-result p2

    iput p2, p0, Lb/f/b/k/g$a;->h:I

    .line 21
    invoke-virtual {p1}, Lb/f/b/k/l;->P()I

    move-result p2

    iput p2, p0, Lb/f/b/k/g$a;->i:I

    .line 22
    invoke-virtual {p1}, Lb/f/b/k/l;->O()I

    move-result p2

    iput p2, p0, Lb/f/b/k/g$a;->j:I

    .line 23
    invoke-virtual {p1}, Lb/f/b/k/l;->M()I

    move-result p1

    iput p1, p0, Lb/f/b/k/g$a;->k:I

    .line 24
    iput p7, p0, Lb/f/b/k/g$a;->q:I

    return-void
.end method

.method public static synthetic a(Lb/f/b/k/g$a;)Lb/f/b/k/e;
    .registers 1

    .line 1
    iget-object p0, p0, Lb/f/b/k/g$a;->b:Lb/f/b/k/e;

    return-object p0
.end method


# virtual methods
.method public a()V
    .registers 3

    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lb/f/b/k/g$a;->c:I

    const/4 v1, 0x0

    .line 13
    iput-object v1, p0, Lb/f/b/k/g$a;->b:Lb/f/b/k/e;

    .line 14
    iput v0, p0, Lb/f/b/k/g$a;->l:I

    .line 15
    iput v0, p0, Lb/f/b/k/g$a;->m:I

    .line 16
    iput v0, p0, Lb/f/b/k/g$a;->n:I

    .line 17
    iput v0, p0, Lb/f/b/k/g$a;->o:I

    .line 18
    iput v0, p0, Lb/f/b/k/g$a;->p:I

    return-void
.end method

.method public a(I)V
    .registers 10

    .line 135
    iget v0, p0, Lb/f/b/k/g$a;->p:I

    if-nez v0, :cond_5

    return-void

    .line 136
    :cond_5
    iget v1, p0, Lb/f/b/k/g$a;->o:I

    .line 137
    div-int/2addr p1, v0

    const/4 v0, 0x0

    :goto_9
    if-ge v0, v1, :cond_66

    .line 138
    iget v2, p0, Lb/f/b/k/g$a;->n:I

    add-int/2addr v2, v0

    iget-object v3, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v3}, Lb/f/b/k/g;->m(Lb/f/b/k/g;)I

    move-result v3

    if-lt v2, v3, :cond_17

    goto :goto_66

    .line 139
    :cond_17
    iget-object v2, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v2}, Lb/f/b/k/g;->n(Lb/f/b/k/g;)[Lb/f/b/k/e;

    move-result-object v2

    iget v3, p0, Lb/f/b/k/g$a;->n:I

    add-int/2addr v3, v0

    aget-object v3, v2, v3

    .line 140
    iget v2, p0, Lb/f/b/k/g$a;->a:I

    if-nez v2, :cond_45

    if-eqz v3, :cond_63

    .line 141
    invoke-virtual {v3}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v2

    sget-object v4, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v2, v4, :cond_63

    .line 142
    iget v2, v3, Lb/f/b/k/e;->j:I

    if-nez v2, :cond_63

    .line 143
    iget-object v2, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    sget-object v4, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    invoke-virtual {v3}, Lb/f/b/k/e;->x()Lb/f/b/k/e$b;

    move-result-object v6

    invoke-virtual {v3}, Lb/f/b/k/e;->k()I

    move-result v7

    move v5, p1

    invoke-virtual/range {v2 .. v7}, Lb/f/b/k/l;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    goto :goto_63

    :cond_45
    if-eqz v3, :cond_63

    .line 144
    invoke-virtual {v3}, Lb/f/b/k/e;->x()Lb/f/b/k/e$b;

    move-result-object v2

    sget-object v4, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v2, v4, :cond_63

    .line 145
    iget v2, v3, Lb/f/b/k/e;->k:I

    if-nez v2, :cond_63

    .line 146
    iget-object v2, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-virtual {v3}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v4

    invoke-virtual {v3}, Lb/f/b/k/e;->A()I

    move-result v5

    sget-object v6, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    move v7, p1

    invoke-virtual/range {v2 .. v7}, Lb/f/b/k/l;->a(Lb/f/b/k/e;Lb/f/b/k/e$b;ILb/f/b/k/e$b;I)V

    :cond_63
    :goto_63
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 147
    :cond_66
    :goto_66
    invoke-virtual {p0}, Lb/f/b/k/g$a;->d()V

    return-void
.end method

.method public a(ILb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;Lb/f/b/k/d;IIIII)V
    .registers 11

    .line 2
    iput p1, p0, Lb/f/b/k/g$a;->a:I

    .line 3
    iput-object p2, p0, Lb/f/b/k/g$a;->d:Lb/f/b/k/d;

    .line 4
    iput-object p3, p0, Lb/f/b/k/g$a;->e:Lb/f/b/k/d;

    .line 5
    iput-object p4, p0, Lb/f/b/k/g$a;->f:Lb/f/b/k/d;

    .line 6
    iput-object p5, p0, Lb/f/b/k/g$a;->g:Lb/f/b/k/d;

    .line 7
    iput p6, p0, Lb/f/b/k/g$a;->h:I

    .line 8
    iput p7, p0, Lb/f/b/k/g$a;->i:I

    .line 9
    iput p8, p0, Lb/f/b/k/g$a;->j:I

    .line 10
    iput p9, p0, Lb/f/b/k/g$a;->k:I

    .line 11
    iput p10, p0, Lb/f/b/k/g$a;->q:I

    return-void
.end method

.method public a(Lb/f/b/k/e;)V
    .registers 8

    .line 19
    iget v0, p0, Lb/f/b/k/g$a;->a:I

    const/16 v1, 0x8

    const/4 v2, 0x0

    if-nez v0, :cond_49

    .line 20
    iget-object v0, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    iget v3, p0, Lb/f/b/k/g$a;->q:I

    invoke-static {v0, p1, v3}, Lb/f/b/k/g;->a(Lb/f/b/k/g;Lb/f/b/k/e;I)I

    move-result v0

    .line 21
    invoke-virtual {p1}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v3

    sget-object v4, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v3, v4, :cond_1e

    .line 22
    iget v0, p0, Lb/f/b/k/g$a;->p:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lb/f/b/k/g$a;->p:I

    const/4 v0, 0x0

    .line 23
    :cond_1e
    iget-object v3, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v3}, Lb/f/b/k/g;->a(Lb/f/b/k/g;)I

    move-result v3

    .line 24
    invoke-virtual {p1}, Lb/f/b/k/e;->z()I

    move-result v4

    if-ne v4, v1, :cond_2b

    goto :goto_2c

    :cond_2b
    move v2, v3

    .line 25
    :goto_2c
    iget v1, p0, Lb/f/b/k/g$a;->l:I

    add-int/2addr v0, v2

    add-int/2addr v1, v0

    iput v1, p0, Lb/f/b/k/g$a;->l:I

    .line 26
    iget-object v0, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    iget v1, p0, Lb/f/b/k/g$a;->q:I

    invoke-static {v0, p1, v1}, Lb/f/b/k/g;->b(Lb/f/b/k/g;Lb/f/b/k/e;I)I

    move-result v0

    .line 27
    iget-object v1, p0, Lb/f/b/k/g$a;->b:Lb/f/b/k/e;

    if-eqz v1, :cond_42

    iget v1, p0, Lb/f/b/k/g$a;->c:I

    if-ge v1, v0, :cond_8a

    .line 28
    :cond_42
    iput-object p1, p0, Lb/f/b/k/g$a;->b:Lb/f/b/k/e;

    .line 29
    iput v0, p0, Lb/f/b/k/g$a;->c:I

    .line 30
    iput v0, p0, Lb/f/b/k/g$a;->m:I

    goto :goto_8a

    .line 31
    :cond_49
    iget-object v0, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    iget v3, p0, Lb/f/b/k/g$a;->q:I

    invoke-static {v0, p1, v3}, Lb/f/b/k/g;->a(Lb/f/b/k/g;Lb/f/b/k/e;I)I

    move-result v0

    .line 32
    iget-object v3, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    iget v4, p0, Lb/f/b/k/g$a;->q:I

    invoke-static {v3, p1, v4}, Lb/f/b/k/g;->b(Lb/f/b/k/g;Lb/f/b/k/e;I)I

    move-result v3

    .line 33
    invoke-virtual {p1}, Lb/f/b/k/e;->x()Lb/f/b/k/e$b;

    move-result-object v4

    sget-object v5, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v4, v5, :cond_68

    .line 34
    iget v3, p0, Lb/f/b/k/g$a;->p:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lb/f/b/k/g$a;->p:I

    const/4 v3, 0x0

    .line 35
    :cond_68
    iget-object v4, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v4}, Lb/f/b/k/g;->b(Lb/f/b/k/g;)I

    move-result v4

    .line 36
    invoke-virtual {p1}, Lb/f/b/k/e;->z()I

    move-result v5

    if-ne v5, v1, :cond_75

    goto :goto_76

    :cond_75
    move v2, v4

    .line 37
    :goto_76
    iget v1, p0, Lb/f/b/k/g$a;->m:I

    add-int/2addr v3, v2

    add-int/2addr v1, v3

    iput v1, p0, Lb/f/b/k/g$a;->m:I

    .line 38
    iget-object v1, p0, Lb/f/b/k/g$a;->b:Lb/f/b/k/e;

    if-eqz v1, :cond_84

    iget v1, p0, Lb/f/b/k/g$a;->c:I

    if-ge v1, v0, :cond_8a

    .line 39
    :cond_84
    iput-object p1, p0, Lb/f/b/k/g$a;->b:Lb/f/b/k/e;

    .line 40
    iput v0, p0, Lb/f/b/k/g$a;->c:I

    .line 41
    iput v0, p0, Lb/f/b/k/g$a;->l:I

    .line 42
    :cond_8a
    :goto_8a
    iget p1, p0, Lb/f/b/k/g$a;->o:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lb/f/b/k/g$a;->o:I

    return-void
.end method

.method public a(ZIZ)V
    .registers 20

    move-object/from16 v0, p0

    .line 43
    iget v1, v0, Lb/f/b/k/g$a;->o:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_6
    if-ge v3, v1, :cond_27

    .line 44
    iget v4, v0, Lb/f/b/k/g$a;->n:I

    add-int/2addr v4, v3

    iget-object v5, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v5}, Lb/f/b/k/g;->m(Lb/f/b/k/g;)I

    move-result v5

    if-lt v4, v5, :cond_14

    goto :goto_27

    .line 45
    :cond_14
    iget-object v4, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v4}, Lb/f/b/k/g;->n(Lb/f/b/k/g;)[Lb/f/b/k/e;

    move-result-object v4

    iget v5, v0, Lb/f/b/k/g$a;->n:I

    add-int/2addr v5, v3

    aget-object v4, v4, v5

    if-eqz v4, :cond_24

    .line 46
    invoke-virtual {v4}, Lb/f/b/k/e;->I()V

    :cond_24
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    :cond_27
    :goto_27
    if-eqz v1, :cond_35c

    .line 47
    iget-object v3, v0, Lb/f/b/k/g$a;->b:Lb/f/b/k/e;

    if-nez v3, :cond_2f

    goto/16 :goto_35c

    :cond_2f
    if-eqz p3, :cond_35

    if-nez p2, :cond_35

    const/4 v4, 0x1

    goto :goto_36

    :cond_35
    const/4 v4, 0x0

    :goto_36
    const/4 v5, -0x1

    const/4 v6, 0x0

    const/4 v7, -0x1

    const/4 v8, -0x1

    :goto_3a
    if-ge v6, v1, :cond_67

    if-eqz p1, :cond_42

    add-int/lit8 v9, v1, -0x1

    sub-int/2addr v9, v6

    goto :goto_43

    :cond_42
    move v9, v6

    .line 48
    :goto_43
    iget v10, v0, Lb/f/b/k/g$a;->n:I

    add-int/2addr v10, v9

    iget-object v11, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v11}, Lb/f/b/k/g;->m(Lb/f/b/k/g;)I

    move-result v11

    if-lt v10, v11, :cond_4f

    goto :goto_67

    .line 49
    :cond_4f
    iget-object v10, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v10}, Lb/f/b/k/g;->n(Lb/f/b/k/g;)[Lb/f/b/k/e;

    move-result-object v10

    iget v11, v0, Lb/f/b/k/g$a;->n:I

    add-int/2addr v11, v9

    aget-object v9, v10, v11

    .line 50
    invoke-virtual {v9}, Lb/f/b/k/e;->z()I

    move-result v9

    if-nez v9, :cond_64

    if-ne v7, v5, :cond_63

    move v7, v6

    :cond_63
    move v8, v6

    :cond_64
    add-int/lit8 v6, v6, 0x1

    goto :goto_3a

    :cond_67
    :goto_67
    const/4 v6, 0x0

    .line 51
    iget v9, v0, Lb/f/b/k/g$a;->a:I

    if-nez v9, :cond_1eb

    .line 52
    iget-object v9, v0, Lb/f/b/k/g$a;->b:Lb/f/b/k/e;

    .line 53
    iget-object v10, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v10}, Lb/f/b/k/g;->o(Lb/f/b/k/g;)I

    move-result v10

    invoke-virtual {v9, v10}, Lb/f/b/k/e;->o(I)V

    .line 54
    iget v10, v0, Lb/f/b/k/g$a;->i:I

    if-lez p2, :cond_82

    .line 55
    iget-object v11, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v11}, Lb/f/b/k/g;->b(Lb/f/b/k/g;)I

    move-result v11

    add-int/2addr v10, v11

    .line 56
    :cond_82
    iget-object v11, v9, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v12, v0, Lb/f/b/k/g$a;->e:Lb/f/b/k/d;

    invoke-virtual {v11, v12, v10}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    if-eqz p3, :cond_94

    .line 57
    iget-object v10, v9, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget-object v11, v0, Lb/f/b/k/g$a;->g:Lb/f/b/k/d;

    iget v12, v0, Lb/f/b/k/g$a;->k:I

    invoke-virtual {v10, v11, v12}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    :cond_94
    if-lez p2, :cond_a1

    .line 58
    iget-object v10, v0, Lb/f/b/k/g$a;->e:Lb/f/b/k/d;

    iget-object v10, v10, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    iget-object v10, v10, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    .line 59
    iget-object v11, v9, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {v10, v11, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    .line 60
    :cond_a1
    iget-object v10, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v10}, Lb/f/b/k/g;->p(Lb/f/b/k/g;)I

    move-result v10

    const/4 v11, 0x3

    if-ne v10, v11, :cond_db

    invoke-virtual {v9}, Lb/f/b/k/e;->D()Z

    move-result v10

    if-nez v10, :cond_db

    const/4 v10, 0x0

    :goto_b1
    if-ge v10, v1, :cond_db

    if-eqz p1, :cond_b9

    add-int/lit8 v12, v1, -0x1

    sub-int/2addr v12, v10

    goto :goto_ba

    :cond_b9
    move v12, v10

    .line 61
    :goto_ba
    iget v13, v0, Lb/f/b/k/g$a;->n:I

    add-int/2addr v13, v12

    iget-object v14, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v14}, Lb/f/b/k/g;->m(Lb/f/b/k/g;)I

    move-result v14

    if-lt v13, v14, :cond_c6

    goto :goto_db

    .line 62
    :cond_c6
    iget-object v13, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v13}, Lb/f/b/k/g;->n(Lb/f/b/k/g;)[Lb/f/b/k/e;

    move-result-object v13

    iget v14, v0, Lb/f/b/k/g$a;->n:I

    add-int/2addr v14, v12

    aget-object v12, v13, v14

    .line 63
    invoke-virtual {v12}, Lb/f/b/k/e;->D()Z

    move-result v13

    if-eqz v13, :cond_d8

    goto :goto_dc

    :cond_d8
    add-int/lit8 v10, v10, 0x1

    goto :goto_b1

    :cond_db
    :goto_db
    move-object v12, v9

    :goto_dc
    const/4 v10, 0x0

    :goto_dd
    if-ge v10, v1, :cond_35c

    if-eqz p1, :cond_e5

    add-int/lit8 v13, v1, -0x1

    sub-int/2addr v13, v10

    goto :goto_e6

    :cond_e5
    move v13, v10

    .line 64
    :goto_e6
    iget v14, v0, Lb/f/b/k/g$a;->n:I

    add-int/2addr v14, v13

    iget-object v15, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v15}, Lb/f/b/k/g;->m(Lb/f/b/k/g;)I

    move-result v15

    if-lt v14, v15, :cond_f3

    goto/16 :goto_35c

    .line 65
    :cond_f3
    iget-object v14, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v14}, Lb/f/b/k/g;->n(Lb/f/b/k/g;)[Lb/f/b/k/e;

    move-result-object v14

    iget v15, v0, Lb/f/b/k/g$a;->n:I

    add-int/2addr v15, v13

    aget-object v14, v14, v15

    if-nez v10, :cond_109

    .line 66
    iget-object v15, v14, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v11, v0, Lb/f/b/k/g$a;->d:Lb/f/b/k/d;

    iget v3, v0, Lb/f/b/k/g$a;->h:I

    invoke-virtual {v14, v15, v11, v3}, Lb/f/b/k/e;->a(Lb/f/b/k/d;Lb/f/b/k/d;I)V

    :cond_109
    if-nez v13, :cond_14c

    .line 67
    iget-object v3, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v3}, Lb/f/b/k/g;->q(Lb/f/b/k/g;)I

    move-result v3

    .line 68
    iget-object v11, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v11}, Lb/f/b/k/g;->r(Lb/f/b/k/g;)F

    move-result v11

    .line 69
    iget v13, v0, Lb/f/b/k/g$a;->n:I

    if-nez v13, :cond_130

    iget-object v13, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v13}, Lb/f/b/k/g;->c(Lb/f/b/k/g;)I

    move-result v13

    if-eq v13, v5, :cond_130

    .line 70
    iget-object v3, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v3}, Lb/f/b/k/g;->c(Lb/f/b/k/g;)I

    move-result v3

    .line 71
    iget-object v11, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v11}, Lb/f/b/k/g;->d(Lb/f/b/k/g;)F

    move-result v11

    goto :goto_146

    :cond_130
    if-eqz p3, :cond_146

    .line 72
    iget-object v13, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v13}, Lb/f/b/k/g;->e(Lb/f/b/k/g;)I

    move-result v13

    if-eq v13, v5, :cond_146

    .line 73
    iget-object v3, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v3}, Lb/f/b/k/g;->e(Lb/f/b/k/g;)I

    move-result v3

    .line 74
    iget-object v11, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v11}, Lb/f/b/k/g;->f(Lb/f/b/k/g;)F

    move-result v11

    .line 75
    :cond_146
    :goto_146
    invoke-virtual {v14, v3}, Lb/f/b/k/e;->j(I)V

    .line 76
    invoke-virtual {v14, v11}, Lb/f/b/k/e;->a(F)V

    :cond_14c
    add-int/lit8 v3, v1, -0x1

    if-ne v10, v3, :cond_159

    .line 77
    iget-object v3, v14, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v11, v0, Lb/f/b/k/g$a;->f:Lb/f/b/k/d;

    iget v13, v0, Lb/f/b/k/g$a;->j:I

    invoke-virtual {v14, v3, v11, v13}, Lb/f/b/k/e;->a(Lb/f/b/k/d;Lb/f/b/k/d;I)V

    :cond_159
    if-eqz v6, :cond_184

    .line 78
    iget-object v3, v14, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v11, v6, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v13, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v13}, Lb/f/b/k/g;->a(Lb/f/b/k/g;)I

    move-result v13

    invoke-virtual {v3, v11, v13}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    if-ne v10, v7, :cond_171

    .line 79
    iget-object v3, v14, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget v11, v0, Lb/f/b/k/g$a;->h:I

    invoke-virtual {v3, v11}, Lb/f/b/k/d;->a(I)V

    .line 80
    :cond_171
    iget-object v3, v6, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v11, v14, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v3, v11, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    const/4 v3, 0x1

    add-int/lit8 v11, v8, 0x1

    if-ne v10, v11, :cond_184

    .line 81
    iget-object v3, v6, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget v6, v0, Lb/f/b/k/g$a;->j:I

    invoke-virtual {v3, v6}, Lb/f/b/k/d;->a(I)V

    :cond_184
    if-eq v14, v9, :cond_1e4

    .line 82
    iget-object v3, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v3}, Lb/f/b/k/g;->p(Lb/f/b/k/g;)I

    move-result v3

    const/4 v6, 0x3

    if-ne v3, v6, :cond_1a5

    .line 83
    invoke-virtual {v12}, Lb/f/b/k/e;->D()Z

    move-result v3

    if-eqz v3, :cond_1a5

    if-eq v14, v12, :cond_1a5

    .line 84
    invoke-virtual {v14}, Lb/f/b/k/e;->D()Z

    move-result v3

    if-eqz v3, :cond_1a5

    .line 85
    iget-object v3, v14, Lb/f/b/k/e;->E:Lb/f/b/k/d;

    iget-object v11, v12, Lb/f/b/k/e;->E:Lb/f/b/k/d;

    invoke-virtual {v3, v11, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto :goto_1e5

    .line 86
    :cond_1a5
    iget-object v3, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v3}, Lb/f/b/k/g;->p(Lb/f/b/k/g;)I

    move-result v3

    if-eqz v3, :cond_1dc

    const/4 v11, 0x1

    if-eq v3, v11, :cond_1d4

    if-eqz v4, :cond_1c5

    .line 87
    iget-object v3, v14, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v11, v0, Lb/f/b/k/g$a;->e:Lb/f/b/k/d;

    iget v13, v0, Lb/f/b/k/g$a;->i:I

    invoke-virtual {v3, v11, v13}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    .line 88
    iget-object v3, v14, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget-object v11, v0, Lb/f/b/k/g$a;->g:Lb/f/b/k/d;

    iget v13, v0, Lb/f/b/k/g$a;->k:I

    invoke-virtual {v3, v11, v13}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto :goto_1e5

    .line 89
    :cond_1c5
    iget-object v3, v14, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v11, v9, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {v3, v11, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    .line 90
    iget-object v3, v14, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget-object v11, v9, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {v3, v11, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto :goto_1e5

    .line 91
    :cond_1d4
    iget-object v3, v14, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget-object v11, v9, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {v3, v11, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto :goto_1e5

    .line 92
    :cond_1dc
    iget-object v3, v14, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v11, v9, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {v3, v11, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto :goto_1e5

    :cond_1e4
    const/4 v6, 0x3

    :goto_1e5
    add-int/lit8 v10, v10, 0x1

    move-object v6, v14

    const/4 v11, 0x3

    goto/16 :goto_dd

    .line 93
    :cond_1eb
    iget-object v3, v0, Lb/f/b/k/g$a;->b:Lb/f/b/k/e;

    .line 94
    iget-object v9, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v9}, Lb/f/b/k/g;->q(Lb/f/b/k/g;)I

    move-result v9

    invoke-virtual {v3, v9}, Lb/f/b/k/e;->j(I)V

    .line 95
    iget v9, v0, Lb/f/b/k/g$a;->h:I

    if-lez p2, :cond_201

    .line 96
    iget-object v10, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v10}, Lb/f/b/k/g;->a(Lb/f/b/k/g;)I

    move-result v10

    add-int/2addr v9, v10

    :cond_201
    if-eqz p1, :cond_223

    .line 97
    iget-object v10, v3, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v11, v0, Lb/f/b/k/g$a;->f:Lb/f/b/k/d;

    invoke-virtual {v10, v11, v9}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    if-eqz p3, :cond_215

    .line 98
    iget-object v9, v3, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v10, v0, Lb/f/b/k/g$a;->d:Lb/f/b/k/d;

    iget v11, v0, Lb/f/b/k/g$a;->j:I

    invoke-virtual {v9, v10, v11}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    :cond_215
    if-lez p2, :cond_242

    .line 99
    iget-object v9, v0, Lb/f/b/k/g$a;->f:Lb/f/b/k/d;

    iget-object v9, v9, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    iget-object v9, v9, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    .line 100
    iget-object v10, v3, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v9, v10, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto :goto_242

    .line 101
    :cond_223
    iget-object v10, v3, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v11, v0, Lb/f/b/k/g$a;->d:Lb/f/b/k/d;

    invoke-virtual {v10, v11, v9}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    if-eqz p3, :cond_235

    .line 102
    iget-object v9, v3, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v10, v0, Lb/f/b/k/g$a;->f:Lb/f/b/k/d;

    iget v11, v0, Lb/f/b/k/g$a;->j:I

    invoke-virtual {v9, v10, v11}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    :cond_235
    if-lez p2, :cond_242

    .line 103
    iget-object v9, v0, Lb/f/b/k/g$a;->d:Lb/f/b/k/d;

    iget-object v9, v9, Lb/f/b/k/d;->b:Lb/f/b/k/e;

    iget-object v9, v9, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    .line 104
    iget-object v10, v3, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v9, v10, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    :cond_242
    :goto_242
    const/4 v9, 0x0

    :goto_243
    if-ge v9, v1, :cond_35c

    .line 105
    iget v10, v0, Lb/f/b/k/g$a;->n:I

    add-int/2addr v10, v9

    iget-object v11, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v11}, Lb/f/b/k/g;->m(Lb/f/b/k/g;)I

    move-result v11

    if-lt v10, v11, :cond_252

    goto/16 :goto_35c

    .line 106
    :cond_252
    iget-object v10, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v10}, Lb/f/b/k/g;->n(Lb/f/b/k/g;)[Lb/f/b/k/e;

    move-result-object v10

    iget v11, v0, Lb/f/b/k/g$a;->n:I

    add-int/2addr v11, v9

    aget-object v10, v10, v11

    if-nez v9, :cond_2a9

    .line 107
    iget-object v11, v10, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v12, v0, Lb/f/b/k/g$a;->e:Lb/f/b/k/d;

    iget v13, v0, Lb/f/b/k/g$a;->i:I

    invoke-virtual {v10, v11, v12, v13}, Lb/f/b/k/e;->a(Lb/f/b/k/d;Lb/f/b/k/d;I)V

    .line 108
    iget-object v11, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v11}, Lb/f/b/k/g;->o(Lb/f/b/k/g;)I

    move-result v11

    .line 109
    iget-object v12, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v12}, Lb/f/b/k/g;->g(Lb/f/b/k/g;)F

    move-result v12

    .line 110
    iget v13, v0, Lb/f/b/k/g$a;->n:I

    if-nez v13, :cond_28d

    iget-object v13, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v13}, Lb/f/b/k/g;->h(Lb/f/b/k/g;)I

    move-result v13

    if-eq v13, v5, :cond_28d

    .line 111
    iget-object v11, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v11}, Lb/f/b/k/g;->h(Lb/f/b/k/g;)I

    move-result v11

    .line 112
    iget-object v12, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v12}, Lb/f/b/k/g;->i(Lb/f/b/k/g;)F

    move-result v12

    goto :goto_2a3

    :cond_28d
    if-eqz p3, :cond_2a3

    .line 113
    iget-object v13, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v13}, Lb/f/b/k/g;->j(Lb/f/b/k/g;)I

    move-result v13

    if-eq v13, v5, :cond_2a3

    .line 114
    iget-object v11, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v11}, Lb/f/b/k/g;->j(Lb/f/b/k/g;)I

    move-result v11

    .line 115
    iget-object v12, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v12}, Lb/f/b/k/g;->k(Lb/f/b/k/g;)F

    move-result v12

    .line 116
    :cond_2a3
    :goto_2a3
    invoke-virtual {v10, v11}, Lb/f/b/k/e;->o(I)V

    .line 117
    invoke-virtual {v10, v12}, Lb/f/b/k/e;->c(F)V

    :cond_2a9
    add-int/lit8 v11, v1, -0x1

    if-ne v9, v11, :cond_2b6

    .line 118
    iget-object v11, v10, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget-object v12, v0, Lb/f/b/k/g$a;->g:Lb/f/b/k/d;

    iget v13, v0, Lb/f/b/k/g$a;->k:I

    invoke-virtual {v10, v11, v12, v13}, Lb/f/b/k/e;->a(Lb/f/b/k/d;Lb/f/b/k/d;I)V

    :cond_2b6
    if-eqz v6, :cond_2e1

    .line 119
    iget-object v11, v10, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v12, v6, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget-object v13, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v13}, Lb/f/b/k/g;->b(Lb/f/b/k/g;)I

    move-result v13

    invoke-virtual {v11, v12, v13}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    if-ne v9, v7, :cond_2ce

    .line 120
    iget-object v11, v10, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget v12, v0, Lb/f/b/k/g$a;->i:I

    invoke-virtual {v11, v12}, Lb/f/b/k/d;->a(I)V

    .line 121
    :cond_2ce
    iget-object v11, v6, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget-object v12, v10, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {v11, v12, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    const/4 v11, 0x1

    add-int/lit8 v12, v8, 0x1

    if-ne v9, v12, :cond_2e1

    .line 122
    iget-object v6, v6, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget v11, v0, Lb/f/b/k/g$a;->k:I

    invoke-virtual {v6, v11}, Lb/f/b/k/d;->a(I)V

    :cond_2e1
    if-eq v10, v3, :cond_356

    const/4 v6, 0x2

    if-eqz p1, :cond_313

    .line 123
    iget-object v11, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v11}, Lb/f/b/k/g;->l(Lb/f/b/k/g;)I

    move-result v11

    if-eqz v11, :cond_30b

    const/4 v12, 0x1

    if-eq v11, v12, :cond_303

    if-eq v11, v6, :cond_2f4

    goto :goto_356

    .line 124
    :cond_2f4
    iget-object v6, v10, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v11, v3, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v6, v11, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    .line 125
    iget-object v6, v10, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v11, v3, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v6, v11, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto :goto_356

    .line 126
    :cond_303
    iget-object v6, v10, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v11, v3, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v6, v11, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto :goto_356

    .line 127
    :cond_30b
    iget-object v6, v10, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v11, v3, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v6, v11, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto :goto_356

    .line 128
    :cond_313
    iget-object v11, v0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v11}, Lb/f/b/k/g;->l(Lb/f/b/k/g;)I

    move-result v11

    if-eqz v11, :cond_34d

    const/4 v12, 0x1

    if-eq v11, v12, :cond_345

    if-eq v11, v6, :cond_321

    goto :goto_357

    :cond_321
    if-eqz v4, :cond_336

    .line 129
    iget-object v6, v10, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v11, v0, Lb/f/b/k/g$a;->d:Lb/f/b/k/d;

    iget v13, v0, Lb/f/b/k/g$a;->h:I

    invoke-virtual {v6, v11, v13}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    .line 130
    iget-object v6, v10, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v11, v0, Lb/f/b/k/g$a;->f:Lb/f/b/k/d;

    iget v13, v0, Lb/f/b/k/g$a;->j:I

    invoke-virtual {v6, v11, v13}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto :goto_357

    .line 131
    :cond_336
    iget-object v6, v10, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v11, v3, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v6, v11, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    .line 132
    iget-object v6, v10, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v11, v3, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v6, v11, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto :goto_357

    .line 133
    :cond_345
    iget-object v6, v10, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v11, v3, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v6, v11, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto :goto_357

    :cond_34d
    const/4 v12, 0x1

    .line 134
    iget-object v6, v10, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v11, v3, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v6, v11, v2}, Lb/f/b/k/d;->a(Lb/f/b/k/d;I)Z

    goto :goto_357

    :cond_356
    :goto_356
    const/4 v12, 0x1

    :goto_357
    add-int/lit8 v9, v9, 0x1

    move-object v6, v10

    goto/16 :goto_243

    :cond_35c
    :goto_35c
    return-void
.end method

.method public b()I
    .registers 3

    .line 2
    iget v0, p0, Lb/f/b/k/g$a;->a:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_f

    .line 3
    iget v0, p0, Lb/f/b/k/g$a;->m:I

    iget-object v1, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v1}, Lb/f/b/k/g;->b(Lb/f/b/k/g;)I

    move-result v1

    sub-int/2addr v0, v1

    return v0

    .line 4
    :cond_f
    iget v0, p0, Lb/f/b/k/g$a;->m:I

    return v0
.end method

.method public b(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/f/b/k/g$a;->n:I

    return-void
.end method

.method public c()I
    .registers 3

    .line 1
    iget v0, p0, Lb/f/b/k/g$a;->a:I

    if-nez v0, :cond_e

    .line 2
    iget v0, p0, Lb/f/b/k/g$a;->l:I

    iget-object v1, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v1}, Lb/f/b/k/g;->a(Lb/f/b/k/g;)I

    move-result v1

    sub-int/2addr v0, v1

    return v0

    .line 3
    :cond_e
    iget v0, p0, Lb/f/b/k/g$a;->l:I

    return v0
.end method

.method public final d()V
    .registers 10

    const/4 v0, 0x0

    .line 1
    iput v0, p0, Lb/f/b/k/g$a;->l:I

    .line 2
    iput v0, p0, Lb/f/b/k/g$a;->m:I

    const/4 v1, 0x0

    .line 3
    iput-object v1, p0, Lb/f/b/k/g$a;->b:Lb/f/b/k/e;

    .line 4
    iput v0, p0, Lb/f/b/k/g$a;->c:I

    .line 5
    iget v1, p0, Lb/f/b/k/g$a;->o:I

    const/4 v2, 0x0

    :goto_d
    if-ge v2, v1, :cond_90

    .line 6
    iget v3, p0, Lb/f/b/k/g$a;->n:I

    add-int/2addr v3, v2

    iget-object v4, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v4}, Lb/f/b/k/g;->m(Lb/f/b/k/g;)I

    move-result v4

    if-lt v3, v4, :cond_1c

    goto/16 :goto_90

    .line 7
    :cond_1c
    iget-object v3, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v3}, Lb/f/b/k/g;->n(Lb/f/b/k/g;)[Lb/f/b/k/e;

    move-result-object v3

    iget v4, p0, Lb/f/b/k/g$a;->n:I

    add-int/2addr v4, v2

    aget-object v3, v3, v4

    .line 8
    iget v4, p0, Lb/f/b/k/g$a;->a:I

    const/16 v5, 0x8

    if-nez v4, :cond_5b

    .line 9
    invoke-virtual {v3}, Lb/f/b/k/e;->A()I

    move-result v4

    .line 10
    iget-object v6, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v6}, Lb/f/b/k/g;->a(Lb/f/b/k/g;)I

    move-result v6

    .line 11
    invoke-virtual {v3}, Lb/f/b/k/e;->z()I

    move-result v7

    if-ne v7, v5, :cond_3e

    const/4 v6, 0x0

    .line 12
    :cond_3e
    iget v5, p0, Lb/f/b/k/g$a;->l:I

    add-int/2addr v4, v6

    add-int/2addr v5, v4

    iput v5, p0, Lb/f/b/k/g$a;->l:I

    .line 13
    iget-object v4, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    iget v5, p0, Lb/f/b/k/g$a;->q:I

    invoke-static {v4, v3, v5}, Lb/f/b/k/g;->b(Lb/f/b/k/g;Lb/f/b/k/e;I)I

    move-result v4

    .line 14
    iget-object v5, p0, Lb/f/b/k/g$a;->b:Lb/f/b/k/e;

    if-eqz v5, :cond_54

    iget v5, p0, Lb/f/b/k/g$a;->c:I

    if-ge v5, v4, :cond_8c

    .line 15
    :cond_54
    iput-object v3, p0, Lb/f/b/k/g$a;->b:Lb/f/b/k/e;

    .line 16
    iput v4, p0, Lb/f/b/k/g$a;->c:I

    .line 17
    iput v4, p0, Lb/f/b/k/g$a;->m:I

    goto :goto_8c

    .line 18
    :cond_5b
    iget-object v4, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    iget v6, p0, Lb/f/b/k/g$a;->q:I

    invoke-static {v4, v3, v6}, Lb/f/b/k/g;->a(Lb/f/b/k/g;Lb/f/b/k/e;I)I

    move-result v4

    .line 19
    iget-object v6, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    iget v7, p0, Lb/f/b/k/g$a;->q:I

    invoke-static {v6, v3, v7}, Lb/f/b/k/g;->b(Lb/f/b/k/g;Lb/f/b/k/e;I)I

    move-result v6

    .line 20
    iget-object v7, p0, Lb/f/b/k/g$a;->r:Lb/f/b/k/g;

    invoke-static {v7}, Lb/f/b/k/g;->b(Lb/f/b/k/g;)I

    move-result v7

    .line 21
    invoke-virtual {v3}, Lb/f/b/k/e;->z()I

    move-result v8

    if-ne v8, v5, :cond_78

    const/4 v7, 0x0

    .line 22
    :cond_78
    iget v5, p0, Lb/f/b/k/g$a;->m:I

    add-int/2addr v6, v7

    add-int/2addr v5, v6

    iput v5, p0, Lb/f/b/k/g$a;->m:I

    .line 23
    iget-object v5, p0, Lb/f/b/k/g$a;->b:Lb/f/b/k/e;

    if-eqz v5, :cond_86

    iget v5, p0, Lb/f/b/k/g$a;->c:I

    if-ge v5, v4, :cond_8c

    .line 24
    :cond_86
    iput-object v3, p0, Lb/f/b/k/g$a;->b:Lb/f/b/k/e;

    .line 25
    iput v4, p0, Lb/f/b/k/g$a;->c:I

    .line 26
    iput v4, p0, Lb/f/b/k/g$a;->l:I

    :cond_8c
    :goto_8c
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_d

    :cond_90
    :goto_90
    return-void
.end method
