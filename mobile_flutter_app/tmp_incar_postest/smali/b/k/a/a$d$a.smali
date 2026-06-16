.class public Lb/k/a/a$d$a;
.super Ljava/lang/Object;
.source "AnimationHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/k/a/a$d;-><init>(Lb/k/a/a$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/k/a/a$d;


# direct methods
.method public constructor <init>(Lb/k/a/a$d;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/k/a/a$d$a;->h:Lb/k/a/a$d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/k/a/a$d$a;->h:Lb/k/a/a$d;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lb/k/a/a$d;->d:J

    .line 2
    iget-object v0, p0, Lb/k/a/a$d$a;->h:Lb/k/a/a$d;

    iget-object v0, v0, Lb/k/a/a$c;->a:Lb/k/a/a$a;

    invoke-virtual {v0}, Lb/k/a/a$a;->a()V

    return-void
.end method
