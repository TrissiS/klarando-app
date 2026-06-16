.class public final Ld/a/b/g/l/g/b;
.super Ljava/lang/Object;
.source "L.java"


# static fields
.field public static a:Z = true


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public static varargs a(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 3

    .line 1
    sget-boolean v0, Ld/a/b/g/l/g/b;->a:Z

    if-eqz v0, :cond_d

    .line 2
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "UpdatePluginLog"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_d
    return-void
.end method

.method public static varargs a(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4

    .line 3
    sget-boolean v0, Ld/a/b/g/l/g/b;->a:Z

    if-eqz v0, :cond_d

    .line 4
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "UpdatePluginLog"

    invoke-static {p2, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_d
    return-void
.end method
