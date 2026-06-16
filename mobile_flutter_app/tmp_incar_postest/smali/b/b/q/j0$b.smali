.class public Lb/b/q/j0$b;
.super Ljava/lang/Object;
.source "TooltipCompatHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/q/j0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/b/q/j0;


# direct methods
.method public constructor <init>(Lb/b/q/j0;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/b/q/j0$b;->h:Lb/b/q/j0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/j0$b;->h:Lb/b/q/j0;

    invoke-virtual {v0}, Lb/b/q/j0;->c()V

    return-void
.end method
