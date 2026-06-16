.class public Lcom/hjq/bar/TitleBar$a;
.super Ljava/lang/Object;
.source "TitleBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hjq/bar/TitleBar;->onLayoutChange(Landroid/view/View;IIIIIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lcom/hjq/bar/TitleBar;


# direct methods
.method public constructor <init>(Lcom/hjq/bar/TitleBar;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/hjq/bar/TitleBar$a;->h:Lcom/hjq/bar/TitleBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/hjq/bar/TitleBar$a;->h:Lcom/hjq/bar/TitleBar;

    invoke-virtual {v0, v0}, Landroid/widget/FrameLayout;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method
