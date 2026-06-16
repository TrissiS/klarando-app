.class public Lb/h/d/b$c;
.super Ljava/lang/Object;
.source "ActivityRecreator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/h/d/b;->a(Ljava/lang/Object;ILandroid/app/Activity;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Ljava/lang/Object;

.field public final synthetic i:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lb/h/d/b$c;->h:Ljava/lang/Object;

    iput-object p2, p0, Lb/h/d/b$c;->i:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    .line 1
    :try_start_0
    sget-object v0, Lb/h/d/b;->d:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    const/4 v2, 0x2

    const/4 v3, 0x0

    if-eqz v0, :cond_20

    .line 2
    sget-object v0, Lb/h/d/b;->d:Ljava/lang/reflect/Method;

    iget-object v4, p0, Lb/h/d/b$c;->h:Ljava/lang/Object;

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, p0, Lb/h/d/b$c;->i:Ljava/lang/Object;

    aput-object v6, v5, v3

    .line 3
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v5, v1

    const-string v1, "AppCompat recreation"

    aput-object v1, v5, v2

    .line 4
    invoke-virtual {v0, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5a

    .line 5
    :cond_20
    sget-object v0, Lb/h/d/b;->e:Ljava/lang/reflect/Method;

    iget-object v4, p0, Lb/h/d/b$c;->h:Ljava/lang/Object;

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v5, p0, Lb/h/d/b$c;->i:Ljava/lang/Object;

    aput-object v5, v2, v3

    .line 6
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, v1

    .line 7
    invoke-virtual {v0, v4, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_33
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_33} :catch_3d
    .catchall {:try_start_0 .. :try_end_33} :catchall_34

    goto :goto_5a

    :catchall_34
    move-exception v0

    const-string v1, "ActivityRecreator"

    const-string v2, "Exception while invoking performStopActivity"

    .line 8
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5a

    :catch_3d
    move-exception v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Ljava/lang/RuntimeException;

    if-ne v1, v2, :cond_5a

    .line 10
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5a

    .line 11
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Unable to stop"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_59

    goto :goto_5a

    .line 12
    :cond_59
    throw v0

    :cond_5a
    :goto_5a
    return-void
.end method
