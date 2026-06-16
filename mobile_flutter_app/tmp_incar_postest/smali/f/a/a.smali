.class public final Lf/a/a;
.super Ljava/lang/Object;
.source "Timber.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lf/a/a$b;,
        Lf/a/a$c;
    }
.end annotation


# static fields
.field public static final a:[Lf/a/a$c;

.field public static final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lf/a/a$c;",
            ">;"
        }
    .end annotation
.end field

.field public static volatile c:[Lf/a/a$c;

.field public static final d:Lf/a/a$c;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    new-array v0, v0, [Lf/a/a$c;

    .line 1
    sput-object v0, Lf/a/a;->a:[Lf/a/a$c;

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lf/a/a;->b:Ljava/util/List;

    .line 3
    sget-object v0, Lf/a/a;->a:[Lf/a/a$c;

    sput-object v0, Lf/a/a;->c:[Lf/a/a$c;

    .line 4
    new-instance v0, Lf/a/a$a;

    invoke-direct {v0}, Lf/a/a$a;-><init>()V

    sput-object v0, Lf/a/a;->d:Lf/a/a$c;

    return-void
.end method

.method public static a(Ljava/lang/String;)Lf/a/a$c;
    .registers 5

    .line 2
    sget-object v0, Lf/a/a;->c:[Lf/a/a$c;

    .line 3
    array-length v1, v0

    const/4 v2, 0x0

    :goto_4
    if-ge v2, v1, :cond_10

    aget-object v3, v0, v2

    .line 4
    iget-object v3, v3, Lf/a/a$c;->a:Ljava/lang/ThreadLocal;

    invoke-virtual {v3, p0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 5
    :cond_10
    sget-object p0, Lf/a/a;->d:Lf/a/a$c;

    return-object p0
.end method

.method public static a(Lf/a/a$c;)V
    .registers 3

    if-eqz p0, :cond_2d

    .line 6
    sget-object v0, Lf/a/a;->d:Lf/a/a$c;

    if-eq p0, v0, :cond_25

    .line 7
    sget-object v0, Lf/a/a;->b:Ljava/util/List;

    monitor-enter v0

    .line 8
    :try_start_9
    sget-object v1, Lf/a/a;->b:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    sget-object p0, Lf/a/a;->b:Ljava/util/List;

    sget-object v1, Lf/a/a;->b:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lf/a/a$c;

    invoke-interface {p0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lf/a/a$c;

    sput-object p0, Lf/a/a;->c:[Lf/a/a$c;

    .line 10
    monitor-exit v0

    return-void

    :catchall_22
    move-exception p0

    monitor-exit v0
    :try_end_24
    .catchall {:try_start_9 .. :try_end_24} :catchall_22

    throw p0

    .line 11
    :cond_25
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Cannot plant Timber into itself."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 12
    :cond_2d
    new-instance p0, Ljava/lang/NullPointerException;

    const-string v0, "tree == null"

    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static varargs a(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 3

    .line 1
    sget-object v0, Lf/a/a;->d:Lf/a/a$c;

    invoke-virtual {v0, p0, p1}, Lf/a/a$c;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static varargs b(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 3

    .line 1
    sget-object v0, Lf/a/a;->d:Lf/a/a$c;

    invoke-virtual {v0, p0, p1}, Lf/a/a$c;->c(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method
