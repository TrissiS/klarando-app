.class public Lb/p/d/d$a;
.super Ljava/lang/Object;
.source "FastScroller.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/p/d/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/p/d/d;


# direct methods
.method public constructor <init>(Lb/p/d/d;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/p/d/d$a;->h:Lb/p/d/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/p/d/d$a;->h:Lb/p/d/d;

    const/16 v1, 0x1f4

    invoke-virtual {v0, v1}, Lb/p/d/d;->a(I)V

    return-void
.end method
