.class public final Lf/a/a$a;
.super Lf/a/a$c;
.source "Timber.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lf/a/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lf/a/a$c;-><init>()V

    return-void
.end method


# virtual methods
.method public a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5

    .line 4
    new-instance p1, Ljava/lang/AssertionError;

    const-string p2, "Missing override for log method."

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1
.end method

.method public varargs a(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 7

    .line 1
    sget-object v0, Lf/a/a;->c:[Lf/a/a$c;

    .line 2
    array-length v1, v0

    const/4 v2, 0x0

    :goto_4
    if-ge v2, v1, :cond_e

    aget-object v3, v0, v2

    .line 3
    invoke-virtual {v3, p1, p2}, Lf/a/a$c;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_e
    return-void
.end method

.method public varargs c(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 7

    .line 1
    sget-object v0, Lf/a/a;->c:[Lf/a/a$c;

    .line 2
    array-length v1, v0

    const/4 v2, 0x0

    :goto_4
    if-ge v2, v1, :cond_e

    aget-object v3, v0, v2

    .line 3
    invoke-virtual {v3, p1, p2}, Lf/a/a$c;->c(Ljava/lang/String;[Ljava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_e
    return-void
.end method
