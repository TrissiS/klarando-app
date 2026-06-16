.class public Lb/h/j/f;
.super Ljava/lang/Object;
.source "FontsContractCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/h/j/f$c;,
        Lb/h/j/f$a;,
        Lb/h/j/f$b;
    }
.end annotation


# direct methods
.method public static a(Landroid/content/Context;Lb/h/j/d;IZILandroid/os/Handler;Lb/h/j/f$c;)Landroid/graphics/Typeface;
    .registers 8

    .line 1
    new-instance v0, Lb/h/j/a;

    invoke-direct {v0, p6, p5}, Lb/h/j/a;-><init>(Lb/h/j/f$c;Landroid/os/Handler;)V

    if-eqz p3, :cond_c

    .line 2
    invoke-static {p0, p1, v0, p2, p4}, Lb/h/j/e;->a(Landroid/content/Context;Lb/h/j/d;Lb/h/j/a;II)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0

    :cond_c
    const/4 p3, 0x0

    .line 3
    invoke-static {p0, p1, p2, p3, v0}, Lb/h/j/e;->a(Landroid/content/Context;Lb/h/j/d;ILjava/util/concurrent/Executor;Lb/h/j/a;)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method
