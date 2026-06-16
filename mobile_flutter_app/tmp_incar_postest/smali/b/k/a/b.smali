.class public abstract Lb/k/a/b;
.super Ljava/lang/Object;
.source "DynamicAnimation.java"

# interfaces
.implements Lb/k/a/a$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/k/a/b$q;,
        Lb/k/a/b$p;,
        Lb/k/a/b$o;,
        Lb/k/a/b$r;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lb/k/a/b<",
        "TT;>;>",
        "Ljava/lang/Object;",
        "Lb/k/a/a$b;"
    }
.end annotation


# static fields
.field public static final m:Lb/k/a/b$r;

.field public static final n:Lb/k/a/b$r;

.field public static final o:Lb/k/a/b$r;

.field public static final p:Lb/k/a/b$r;

.field public static final q:Lb/k/a/b$r;

.field public static final r:Lb/k/a/b$r;


# instance fields
.field public a:F

.field public b:F

.field public c:Z

.field public final d:Ljava/lang/Object;

.field public final e:Lb/k/a/c;

.field public f:Z

.field public g:F

.field public h:F

.field public i:J

.field public j:F

.field public final k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/k/a/b$p;",
            ">;"
        }
    .end annotation
.end field

.field public final l:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/k/a/b$q;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    new-instance v0, Lb/k/a/b$f;

    const-string v1, "translationX"

    invoke-direct {v0, v1}, Lb/k/a/b$f;-><init>(Ljava/lang/String;)V

    .line 2
    new-instance v0, Lb/k/a/b$g;

    const-string v1, "translationY"

    invoke-direct {v0, v1}, Lb/k/a/b$g;-><init>(Ljava/lang/String;)V

    .line 3
    new-instance v0, Lb/k/a/b$h;

    const-string v1, "translationZ"

    invoke-direct {v0, v1}, Lb/k/a/b$h;-><init>(Ljava/lang/String;)V

    .line 4
    new-instance v0, Lb/k/a/b$i;

    const-string v1, "scaleX"

    invoke-direct {v0, v1}, Lb/k/a/b$i;-><init>(Ljava/lang/String;)V

    sput-object v0, Lb/k/a/b;->m:Lb/k/a/b$r;

    .line 5
    new-instance v0, Lb/k/a/b$j;

    const-string v1, "scaleY"

    invoke-direct {v0, v1}, Lb/k/a/b$j;-><init>(Ljava/lang/String;)V

    sput-object v0, Lb/k/a/b;->n:Lb/k/a/b$r;

    .line 6
    new-instance v0, Lb/k/a/b$k;

    const-string v1, "rotation"

    invoke-direct {v0, v1}, Lb/k/a/b$k;-><init>(Ljava/lang/String;)V

    sput-object v0, Lb/k/a/b;->o:Lb/k/a/b$r;

    .line 7
    new-instance v0, Lb/k/a/b$l;

    const-string v1, "rotationX"

    invoke-direct {v0, v1}, Lb/k/a/b$l;-><init>(Ljava/lang/String;)V

    sput-object v0, Lb/k/a/b;->p:Lb/k/a/b$r;

    .line 8
    new-instance v0, Lb/k/a/b$m;

    const-string v1, "rotationY"

    invoke-direct {v0, v1}, Lb/k/a/b$m;-><init>(Ljava/lang/String;)V

    sput-object v0, Lb/k/a/b;->q:Lb/k/a/b$r;

    .line 9
    new-instance v0, Lb/k/a/b$n;

    const-string v1, "x"

    invoke-direct {v0, v1}, Lb/k/a/b$n;-><init>(Ljava/lang/String;)V

    .line 10
    new-instance v0, Lb/k/a/b$a;

    const-string v1, "y"

    invoke-direct {v0, v1}, Lb/k/a/b$a;-><init>(Ljava/lang/String;)V

    .line 11
    new-instance v0, Lb/k/a/b$b;

    const-string v1, "z"

    invoke-direct {v0, v1}, Lb/k/a/b$b;-><init>(Ljava/lang/String;)V

    .line 12
    new-instance v0, Lb/k/a/b$c;

    const-string v1, "alpha"

    invoke-direct {v0, v1}, Lb/k/a/b$c;-><init>(Ljava/lang/String;)V

    sput-object v0, Lb/k/a/b;->r:Lb/k/a/b$r;

    .line 13
    new-instance v0, Lb/k/a/b$d;

    const-string v1, "scrollX"

    invoke-direct {v0, v1}, Lb/k/a/b$d;-><init>(Ljava/lang/String;)V

    .line 14
    new-instance v0, Lb/k/a/b$e;

    const-string v1, "scrollY"

    invoke-direct {v0, v1}, Lb/k/a/b$e;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lb/k/a/c;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(TK;",
            "Lb/k/a/c<",
            "TK;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lb/k/a/b;->a:F

    const v0, 0x7f7fffff    # Float.MAX_VALUE

    .line 3
    iput v0, p0, Lb/k/a/b;->b:F

    const/4 v1, 0x0

    .line 4
    iput-boolean v1, p0, Lb/k/a/b;->c:Z

    .line 5
    iput-boolean v1, p0, Lb/k/a/b;->f:Z

    .line 6
    iput v0, p0, Lb/k/a/b;->g:F

    neg-float v0, v0

    .line 7
    iput v0, p0, Lb/k/a/b;->h:F

    const-wide/16 v0, 0x0

    .line 8
    iput-wide v0, p0, Lb/k/a/b;->i:J

    .line 9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/k/a/b;->k:Ljava/util/ArrayList;

    .line 10
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/k/a/b;->l:Ljava/util/ArrayList;

    .line 11
    iput-object p1, p0, Lb/k/a/b;->d:Ljava/lang/Object;

    .line 12
    iput-object p2, p0, Lb/k/a/b;->e:Lb/k/a/c;

    .line 13
    sget-object p1, Lb/k/a/b;->o:Lb/k/a/b$r;

    if-eq p2, p1, :cond_52

    sget-object p1, Lb/k/a/b;->p:Lb/k/a/b$r;

    if-eq p2, p1, :cond_52

    sget-object p1, Lb/k/a/b;->q:Lb/k/a/b$r;

    if-ne p2, p1, :cond_38

    goto :goto_52

    .line 14
    :cond_38
    sget-object p1, Lb/k/a/b;->r:Lb/k/a/b$r;

    const/high16 v0, 0x3b800000    # 0.00390625f

    if-ne p2, p1, :cond_41

    .line 15
    iput v0, p0, Lb/k/a/b;->j:F

    goto :goto_57

    .line 16
    :cond_41
    sget-object p1, Lb/k/a/b;->m:Lb/k/a/b$r;

    if-eq p2, p1, :cond_4f

    sget-object p1, Lb/k/a/b;->n:Lb/k/a/b$r;

    if-ne p2, p1, :cond_4a

    goto :goto_4f

    :cond_4a
    const/high16 p1, 0x3f800000    # 1.0f

    .line 17
    iput p1, p0, Lb/k/a/b;->j:F

    goto :goto_57

    .line 18
    :cond_4f
    :goto_4f
    iput v0, p0, Lb/k/a/b;->j:F

    goto :goto_57

    :cond_52
    :goto_52
    const p1, 0x3dcccccd    # 0.1f

    .line 19
    iput p1, p0, Lb/k/a/b;->j:F

    :goto_57
    return-void
.end method

.method public static a(Ljava/util/ArrayList;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/ArrayList<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_6
    if-ltz v0, :cond_14

    .line 2
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_11

    .line 3
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_11
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    :cond_14
    return-void
.end method


# virtual methods
.method public a()V
    .registers 3

    .line 4
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_13

    .line 5
    iget-boolean v0, p0, Lb/k/a/b;->f:Z

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Lb/k/a/b;->a(Z)V

    :cond_12
    return-void

    .line 7
    :cond_13
    new-instance v0, Landroid/util/AndroidRuntimeException;

    const-string v1, "Animations may only be canceled on the main thread"

    invoke-direct {v0, v1}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public a(F)V
    .registers 5

    .line 25
    iget-object v0, p0, Lb/k/a/b;->e:Lb/k/a/c;

    iget-object v1, p0, Lb/k/a/b;->d:Ljava/lang/Object;

    invoke-virtual {v0, v1, p1}, Lb/k/a/c;->a(Ljava/lang/Object;F)V

    const/4 p1, 0x0

    .line 26
    :goto_8
    iget-object v0, p0, Lb/k/a/b;->l:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_2a

    .line 27
    iget-object v0, p0, Lb/k/a/b;->l:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_27

    .line 28
    iget-object v0, p0, Lb/k/a/b;->l:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/k/a/b$q;

    iget v1, p0, Lb/k/a/b;->b:F

    iget v2, p0, Lb/k/a/b;->a:F

    invoke-interface {v0, p0, v1, v2}, Lb/k/a/b$q;->a(Lb/k/a/b;FF)V

    :cond_27
    add-int/lit8 p1, p1, 0x1

    goto :goto_8

    .line 29
    :cond_2a
    iget-object p1, p0, Lb/k/a/b;->l:Ljava/util/ArrayList;

    invoke-static {p1}, Lb/k/a/b;->a(Ljava/util/ArrayList;)V

    return-void
.end method

.method public final a(Z)V
    .registers 6

    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lb/k/a/b;->f:Z

    .line 18
    invoke-static {}, Lb/k/a/a;->c()Lb/k/a/a;

    move-result-object v1

    invoke-virtual {v1, p0}, Lb/k/a/a;->a(Lb/k/a/a$b;)V

    const-wide/16 v1, 0x0

    .line 19
    iput-wide v1, p0, Lb/k/a/b;->i:J

    .line 20
    iput-boolean v0, p0, Lb/k/a/b;->c:Z

    .line 21
    :goto_10
    iget-object v1, p0, Lb/k/a/b;->k:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_32

    .line 22
    iget-object v1, p0, Lb/k/a/b;->k:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2f

    .line 23
    iget-object v1, p0, Lb/k/a/b;->k:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/k/a/b$p;

    iget v2, p0, Lb/k/a/b;->b:F

    iget v3, p0, Lb/k/a/b;->a:F

    invoke-interface {v1, p0, p1, v2, v3}, Lb/k/a/b$p;->a(Lb/k/a/b;ZFF)V

    :cond_2f
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 24
    :cond_32
    iget-object p1, p0, Lb/k/a/b;->k:Ljava/util/ArrayList;

    invoke-static {p1}, Lb/k/a/b;->a(Ljava/util/ArrayList;)V

    return-void
.end method

.method public a(J)Z
    .registers 9

    .line 8
    iget-wide v0, p0, Lb/k/a/b;->i:J

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-nez v5, :cond_11

    .line 9
    iput-wide p1, p0, Lb/k/a/b;->i:J

    .line 10
    iget p1, p0, Lb/k/a/b;->b:F

    invoke-virtual {p0, p1}, Lb/k/a/b;->a(F)V

    return v2

    :cond_11
    sub-long v0, p1, v0

    .line 11
    iput-wide p1, p0, Lb/k/a/b;->i:J

    .line 12
    invoke-virtual {p0, v0, v1}, Lb/k/a/b;->b(J)Z

    move-result p1

    .line 13
    iget p2, p0, Lb/k/a/b;->b:F

    iget v0, p0, Lb/k/a/b;->g:F

    invoke-static {p2, v0}, Ljava/lang/Math;->min(FF)F

    move-result p2

    iput p2, p0, Lb/k/a/b;->b:F

    .line 14
    iget v0, p0, Lb/k/a/b;->h:F

    invoke-static {p2, v0}, Ljava/lang/Math;->max(FF)F

    move-result p2

    iput p2, p0, Lb/k/a/b;->b:F

    .line 15
    invoke-virtual {p0, p2}, Lb/k/a/b;->a(F)V

    if-eqz p1, :cond_33

    .line 16
    invoke-virtual {p0, v2}, Lb/k/a/b;->a(Z)V

    :cond_33
    return p1
.end method

.method public final b()F
    .registers 3

    .line 3
    iget-object v0, p0, Lb/k/a/b;->e:Lb/k/a/c;

    iget-object v1, p0, Lb/k/a/b;->d:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lb/k/a/c;->a(Ljava/lang/Object;)F

    move-result v0

    return v0
.end method

.method public b(F)Lb/k/a/b;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 1
    iput p1, p0, Lb/k/a/b;->b:F

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lb/k/a/b;->c:Z

    return-object p0
.end method

.method public abstract b(J)Z
.end method

.method public c()F
    .registers 3

    .line 1
    iget v0, p0, Lb/k/a/b;->j:F

    const/high16 v1, 0x3f400000    # 0.75f

    mul-float v0, v0, v1

    return v0
.end method

.method public d()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/k/a/b;->f:Z

    return v0
.end method

.method public e()V
    .registers 3

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_12

    .line 2
    iget-boolean v0, p0, Lb/k/a/b;->f:Z

    if-nez v0, :cond_11

    .line 3
    invoke-virtual {p0}, Lb/k/a/b;->f()V

    :cond_11
    return-void

    .line 4
    :cond_12
    new-instance v0, Landroid/util/AndroidRuntimeException;

    const-string v1, "Animations may only be started on the main thread"

    invoke-direct {v0, v1}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final f()V
    .registers 4

    .line 1
    iget-boolean v0, p0, Lb/k/a/b;->f:Z

    if-nez v0, :cond_31

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lb/k/a/b;->f:Z

    .line 3
    iget-boolean v0, p0, Lb/k/a/b;->c:Z

    if-nez v0, :cond_11

    .line 4
    invoke-virtual {p0}, Lb/k/a/b;->b()F

    move-result v0

    iput v0, p0, Lb/k/a/b;->b:F

    .line 5
    :cond_11
    iget v0, p0, Lb/k/a/b;->b:F

    iget v1, p0, Lb/k/a/b;->g:F

    cmpl-float v1, v0, v1

    if-gtz v1, :cond_29

    iget v1, p0, Lb/k/a/b;->h:F

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_29

    .line 6
    invoke-static {}, Lb/k/a/a;->c()Lb/k/a/a;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-virtual {v0, p0, v1, v2}, Lb/k/a/a;->a(Lb/k/a/a$b;J)V

    goto :goto_31

    .line 7
    :cond_29
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Starting value need to be in between min value and max value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_31
    :goto_31
    return-void
.end method
