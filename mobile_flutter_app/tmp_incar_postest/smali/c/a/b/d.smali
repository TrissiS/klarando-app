.class public final Lc/a/b/d;
.super Lc/a/b/f;
.source "FormatException.java"


# static fields
.field public static final h:Lc/a/b/d;


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    new-instance v0, Lc/a/b/d;

    invoke-direct {v0}, Lc/a/b/d;-><init>()V

    sput-object v0, Lc/a/b/d;->h:Lc/a/b/d;

    .line 2
    sget-object v1, Lc/a/b/f;->NO_TRACE:[Ljava/lang/StackTraceElement;

    invoke-virtual {v0, v1}, Ljava/lang/Exception;->setStackTrace([Ljava/lang/StackTraceElement;)V

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lc/a/b/f;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 2

    .line 2
    invoke-direct {p0, p1}, Lc/a/b/f;-><init>(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static getFormatInstance()Lc/a/b/d;
    .registers 1

    .line 1
    sget-boolean v0, Lc/a/b/f;->isStackTrace:Z

    if-eqz v0, :cond_a

    new-instance v0, Lc/a/b/d;

    invoke-direct {v0}, Lc/a/b/d;-><init>()V

    goto :goto_c

    :cond_a
    sget-object v0, Lc/a/b/d;->h:Lc/a/b/d;

    :goto_c
    return-object v0
.end method

.method public static getFormatInstance(Ljava/lang/Throwable;)Lc/a/b/d;
    .registers 2

    .line 2
    sget-boolean v0, Lc/a/b/f;->isStackTrace:Z

    if-eqz v0, :cond_a

    new-instance v0, Lc/a/b/d;

    invoke-direct {v0, p0}, Lc/a/b/d;-><init>(Ljava/lang/Throwable;)V

    goto :goto_c

    :cond_a
    sget-object v0, Lc/a/b/d;->h:Lc/a/b/d;

    :goto_c
    return-object v0
.end method
