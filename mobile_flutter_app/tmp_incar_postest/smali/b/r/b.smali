.class public final Lb/r/b;
.super Ljava/lang/Object;
.source "TraceApi18Impl.java"


# direct methods
.method public static a()V
    .registers 0

    .line 2
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void
.end method

.method public static a(Ljava/lang/String;)V
    .registers 1

    .line 1
    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    return-void
.end method
