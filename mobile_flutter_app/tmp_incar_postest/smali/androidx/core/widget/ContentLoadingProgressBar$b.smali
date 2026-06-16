.class public Landroidx/core/widget/ContentLoadingProgressBar$b;
.super Ljava/lang/Object;
.source "ContentLoadingProgressBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/widget/ContentLoadingProgressBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Landroidx/core/widget/ContentLoadingProgressBar;


# direct methods
.method public constructor <init>(Landroidx/core/widget/ContentLoadingProgressBar;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/core/widget/ContentLoadingProgressBar$b;->h:Landroidx/core/widget/ContentLoadingProgressBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/core/widget/ContentLoadingProgressBar$b;->h:Landroidx/core/widget/ContentLoadingProgressBar;

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroidx/core/widget/ContentLoadingProgressBar;->j:Z

    .line 2
    iget-boolean v2, v0, Landroidx/core/widget/ContentLoadingProgressBar;->k:Z

    if-nez v2, :cond_14

    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v0, Landroidx/core/widget/ContentLoadingProgressBar;->h:J

    .line 4
    iget-object v0, p0, Landroidx/core/widget/ContentLoadingProgressBar$b;->h:Landroidx/core/widget/ContentLoadingProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :cond_14
    return-void
.end method
