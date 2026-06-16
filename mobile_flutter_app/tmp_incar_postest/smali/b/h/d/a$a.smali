.class public Lb/h/d/a$a;
.super Ljava/lang/Object;
.source "ActivityCompat.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/h/d/a;->b(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/h/d/a$a;->h:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/d/a$a;->h:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_15

    .line 2
    iget-object v0, p0, Lb/h/d/a$a;->h:Landroid/app/Activity;

    invoke-static {v0}, Lb/h/d/b;->a(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_15

    .line 3
    iget-object v0, p0, Lb/h/d/a$a;->h:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->recreate()V

    :cond_15
    return-void
.end method
