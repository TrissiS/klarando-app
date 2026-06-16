.class public final enum Landroidx/constraintlayout/motion/widget/MotionLayout$j;
.super Ljava/lang/Enum;
.source "MotionLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/motion/widget/MotionLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "j"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroidx/constraintlayout/motion/widget/MotionLayout$j;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum FINISHED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

.field public static final enum MOVING:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

.field public static final enum SETUP:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

.field public static final enum UNDEFINED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

.field public static final synthetic h:[Landroidx/constraintlayout/motion/widget/MotionLayout$j;


# direct methods
.method public static constructor <clinit>()V
    .registers 7

    .line 1
    new-instance v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    const/4 v1, 0x0

    const-string v2, "UNDEFINED"

    invoke-direct {v0, v2, v1}, Landroidx/constraintlayout/motion/widget/MotionLayout$j;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->UNDEFINED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    .line 2
    new-instance v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    const/4 v2, 0x1

    const-string v3, "SETUP"

    invoke-direct {v0, v3, v2}, Landroidx/constraintlayout/motion/widget/MotionLayout$j;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->SETUP:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    .line 3
    new-instance v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    const/4 v3, 0x2

    const-string v4, "MOVING"

    invoke-direct {v0, v4, v3}, Landroidx/constraintlayout/motion/widget/MotionLayout$j;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->MOVING:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    .line 4
    new-instance v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    const/4 v4, 0x3

    const-string v5, "FINISHED"

    invoke-direct {v0, v5, v4}, Landroidx/constraintlayout/motion/widget/MotionLayout$j;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->FINISHED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    const/4 v5, 0x4

    new-array v5, v5, [Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    .line 5
    sget-object v6, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->UNDEFINED:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    aput-object v6, v5, v1

    sget-object v1, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->SETUP:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    aput-object v1, v5, v2

    sget-object v1, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->MOVING:Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    aput-object v1, v5, v3

    aput-object v0, v5, v4

    sput-object v5, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->h:[Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroidx/constraintlayout/motion/widget/MotionLayout$j;
    .registers 2

    .line 1
    const-class v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    return-object p0
.end method

.method public static values()[Landroidx/constraintlayout/motion/widget/MotionLayout$j;
    .registers 1

    .line 1
    sget-object v0, Landroidx/constraintlayout/motion/widget/MotionLayout$j;->h:[Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    invoke-virtual {v0}, [Landroidx/constraintlayout/motion/widget/MotionLayout$j;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/constraintlayout/motion/widget/MotionLayout$j;

    return-object v0
.end method
