.class public final Lc/c/d/e;
.super Lc/c/d/f;
.source "SafeToast.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation


# direct methods
.method public constructor <init>(Landroid/app/Application;)V
    .registers 5

    .line 1
    invoke-direct {p0, p1}, Lc/c/d/f;-><init>(Landroid/app/Application;)V

    .line 2
    :try_start_3
    const-class p1, Landroid/widget/Toast;

    const-string v0, "mTN"

    invoke-virtual {p1, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    const/4 v0, 0x1

    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 4
    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 5
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object p1

    const-string v2, "mHandler"

    invoke-virtual {p1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    .line 6
    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 7
    invoke-virtual {p1, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Handler;

    .line 8
    new-instance v2, Lc/c/d/d;

    invoke-direct {v2, v0}, Lc/c/d/d;-><init>(Landroid/os/Handler;)V

    invoke-virtual {p1, v1, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_2e
    .catch Ljava/lang/IllegalAccessException; {:try_start_3 .. :try_end_2e} :catch_31
    .catch Ljava/lang/NoSuchFieldException; {:try_start_3 .. :try_end_2e} :catch_2f

    goto :goto_35

    :catch_2f
    move-exception p1

    goto :goto_32

    :catch_31
    move-exception p1

    .line 9
    :goto_32
    invoke-virtual {p1}, Ljava/lang/ReflectiveOperationException;->printStackTrace()V

    :goto_35
    return-void
.end method
