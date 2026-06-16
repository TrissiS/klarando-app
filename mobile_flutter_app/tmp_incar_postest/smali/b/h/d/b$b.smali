.class public Lb/h/d/b$b;
.super Ljava/lang/Object;
.source "ActivityRecreator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/h/d/b;->a(Landroid/app/Activity;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Landroid/app/Application;

.field public final synthetic i:Lb/h/d/b$d;


# direct methods
.method public constructor <init>(Landroid/app/Application;Lb/h/d/b$d;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lb/h/d/b$b;->h:Landroid/app/Application;

    iput-object p2, p0, Lb/h/d/b$b;->i:Lb/h/d/b$d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/d/b$b;->h:Landroid/app/Application;

    iget-object v1, p0, Lb/h/d/b$b;->i:Lb/h/d/b$d;

    invoke-virtual {v0, v1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    return-void
.end method
