.class public Lb/k/a/a;
.super Ljava/lang/Object;
.source "AnimationHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/k/a/a$c;,
        Lb/k/a/a$d;,
        Lb/k/a/a$e;,
        Lb/k/a/a$a;,
        Lb/k/a/a$b;
    }
.end annotation


# static fields
.field public static final g:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Lb/k/a/a;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Lb/e/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/g<",
            "Lb/k/a/a$b;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/k/a/a$b;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Lb/k/a/a$a;

.field public d:Lb/k/a/a$c;

.field public e:J

.field public f:Z


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lb/k/a/a;->g:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lb/e/g;

    invoke-direct {v0}, Lb/e/g;-><init>()V

    iput-object v0, p0, Lb/k/a/a;->a:Lb/e/g;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/k/a/a;->b:Ljava/util/ArrayList;

    .line 4
    new-instance v0, Lb/k/a/a$a;

    invoke-direct {v0, p0}, Lb/k/a/a$a;-><init>(Lb/k/a/a;)V

    iput-object v0, p0, Lb/k/a/a;->c:Lb/k/a/a$a;

    const-wide/16 v0, 0x0

    .line 5
    iput-wide v0, p0, Lb/k/a/a;->e:J

    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lb/k/a/a;->f:Z

    return-void
.end method

.method public static c()Lb/k/a/a;
    .registers 2

    .line 1
    sget-object v0, Lb/k/a/a;->g:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_12

    .line 2
    sget-object v0, Lb/k/a/a;->g:Ljava/lang/ThreadLocal;

    new-instance v1, Lb/k/a/a;

    invoke-direct {v1}, Lb/k/a/a;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 3
    :cond_12
    sget-object v0, Lb/k/a/a;->g:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/k/a/a;

    return-object v0
.end method


# virtual methods
.method public final a()V
    .registers 3

    .line 16
    iget-boolean v0, p0, Lb/k/a/a;->f:Z

    if-eqz v0, :cond_21

    .line 17
    iget-object v0, p0, Lb/k/a/a;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_c
    if-ltz v0, :cond_1e

    .line 18
    iget-object v1, p0, Lb/k/a/a;->b:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_1b

    .line 19
    iget-object v1, p0, Lb/k/a/a;->b:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_1b
    add-int/lit8 v0, v0, -0x1

    goto :goto_c

    :cond_1e
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lb/k/a/a;->f:Z

    :cond_21
    return-void
.end method

.method public a(J)V
    .registers 8

    .line 10
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const/4 v2, 0x0

    .line 11
    :goto_5
    iget-object v3, p0, Lb/k/a/a;->b:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_24

    .line 12
    iget-object v3, p0, Lb/k/a/a;->b:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/k/a/a$b;

    if-nez v3, :cond_18

    goto :goto_21

    .line 13
    :cond_18
    invoke-virtual {p0, v3, v0, v1}, Lb/k/a/a;->b(Lb/k/a/a$b;J)Z

    move-result v4

    if-eqz v4, :cond_21

    .line 14
    invoke-interface {v3, p1, p2}, Lb/k/a/a$b;->a(J)Z

    :cond_21
    :goto_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 15
    :cond_24
    invoke-virtual {p0}, Lb/k/a/a;->a()V

    return-void
.end method

.method public a(Lb/k/a/a$b;)V
    .registers 4

    .line 6
    iget-object v0, p0, Lb/k/a/a;->a:Lb/e/g;

    invoke-virtual {v0, p1}, Lb/e/g;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    iget-object v0, p0, Lb/k/a/a;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    if-ltz p1, :cond_16

    .line 8
    iget-object v0, p0, Lb/k/a/a;->b:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lb/k/a/a;->f:Z

    :cond_16
    return-void
.end method

.method public a(Lb/k/a/a$b;J)V
    .registers 7

    .line 1
    iget-object v0, p0, Lb/k/a/a;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_f

    .line 2
    invoke-virtual {p0}, Lb/k/a/a;->b()Lb/k/a/a$c;

    move-result-object v0

    invoke-virtual {v0}, Lb/k/a/a$c;->a()V

    .line 3
    :cond_f
    iget-object v0, p0, Lb/k/a/a;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    .line 4
    iget-object v0, p0, Lb/k/a/a;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1c
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-lez v2, :cond_30

    .line 5
    iget-object v0, p0, Lb/k/a/a;->a:Lb/e/g;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    add-long/2addr v1, p2

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_30
    return-void
.end method

.method public b()Lb/k/a/a$c;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/k/a/a;->d:Lb/k/a/a$c;

    if-nez v0, :cond_1d

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_14

    .line 3
    new-instance v0, Lb/k/a/a$e;

    iget-object v1, p0, Lb/k/a/a;->c:Lb/k/a/a$a;

    invoke-direct {v0, v1}, Lb/k/a/a$e;-><init>(Lb/k/a/a$a;)V

    iput-object v0, p0, Lb/k/a/a;->d:Lb/k/a/a$c;

    goto :goto_1d

    .line 4
    :cond_14
    new-instance v0, Lb/k/a/a$d;

    iget-object v1, p0, Lb/k/a/a;->c:Lb/k/a/a$a;

    invoke-direct {v0, v1}, Lb/k/a/a$d;-><init>(Lb/k/a/a$a;)V

    iput-object v0, p0, Lb/k/a/a;->d:Lb/k/a/a$c;

    .line 5
    :cond_1d
    :goto_1d
    iget-object v0, p0, Lb/k/a/a;->d:Lb/k/a/a$c;

    return-object v0
.end method

.method public final b(Lb/k/a/a$b;J)Z
    .registers 8

    .line 6
    iget-object v0, p0, Lb/k/a/a;->a:Lb/e/g;

    invoke-virtual {v0, p1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    const/4 v1, 0x1

    if-nez v0, :cond_c

    return v1

    .line 7
    :cond_c
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    cmp-long v0, v2, p2

    if-gez v0, :cond_1a

    .line 8
    iget-object p2, p0, Lb/k/a/a;->a:Lb/e/g;

    invoke-virtual {p2, p1}, Lb/e/g;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return v1

    :cond_1a
    const/4 p1, 0x0

    return p1
.end method
