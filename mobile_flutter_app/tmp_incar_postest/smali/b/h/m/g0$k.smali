.class public Lb/h/m/g0$k;
.super Lb/h/m/g0$j;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/m/g0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "k"
.end annotation


# static fields
.field public static final o:Lb/h/m/g0;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    sget-object v0, Landroid/view/WindowInsets;->CONSUMED:Landroid/view/WindowInsets;

    invoke-static {v0}, Lb/h/m/g0;->a(Landroid/view/WindowInsets;)Lb/h/m/g0;

    move-result-object v0

    sput-object v0, Lb/h/m/g0$k;->o:Lb/h/m/g0;

    return-void
.end method

.method public constructor <init>(Lb/h/m/g0;Landroid/view/WindowInsets;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1, p2}, Lb/h/m/g0$j;-><init>(Lb/h/m/g0;Landroid/view/WindowInsets;)V

    return-void
.end method

.method public constructor <init>(Lb/h/m/g0;Lb/h/m/g0$k;)V
    .registers 3

    .line 2
    invoke-direct {p0, p1, p2}, Lb/h/m/g0$j;-><init>(Lb/h/m/g0;Lb/h/m/g0$j;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 2

    return-void
.end method
