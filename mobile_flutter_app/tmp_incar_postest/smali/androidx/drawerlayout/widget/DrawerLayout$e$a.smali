.class public Landroidx/drawerlayout/widget/DrawerLayout$e$a;
.super Ljava/lang/Object;
.source "DrawerLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/drawerlayout/widget/DrawerLayout$e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Landroidx/drawerlayout/widget/DrawerLayout$e;


# direct methods
.method public constructor <init>(Landroidx/drawerlayout/widget/DrawerLayout$e;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout$e$a;->h:Landroidx/drawerlayout/widget/DrawerLayout$e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout$e$a;->h:Landroidx/drawerlayout/widget/DrawerLayout$e;

    invoke-virtual {v0}, Landroidx/drawerlayout/widget/DrawerLayout$e;->b()V

    return-void
.end method
