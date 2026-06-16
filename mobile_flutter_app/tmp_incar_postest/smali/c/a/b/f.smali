.class public abstract Lc/a/b/f;
.super Ljava/lang/Exception;
.source "ReaderException.java"


# static fields
.field public static final NO_TRACE:[Ljava/lang/StackTraceElement;

.field public static final isStackTrace:Z


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    const-string v0, "surefire.test.class.path"

    .line 1
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_b

    const/4 v0, 0x1

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    sput-boolean v0, Lc/a/b/f;->isStackTrace:Z

    new-array v0, v1, [Ljava/lang/StackTraceElement;

    .line 2
    sput-object v0, Lc/a/b/f;->NO_TRACE:[Ljava/lang/StackTraceElement;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 2

    .line 2
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final fillInStackTrace()Ljava/lang/Throwable;
    .registers 2

    const/4 v0, 0x0

    return-object v0
.end method
