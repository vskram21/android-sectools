.class public final enum Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;
.super Ljava/lang/Enum;
.source "DiffAlgorithm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/DiffAlgorithm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SupportedAlgorithm"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

.field public static final enum HISTOGRAM:Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

.field public static final enum MYERS:Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 63
    new-instance v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    const-string v1, "MYERS"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;->MYERS:Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    .line 68
    new-instance v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    const-string v1, "HISTOGRAM"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;->HISTOGRAM:Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    .line 59
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    sget-object v1, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;->MYERS:Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;->HISTOGRAM:Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    aput-object v1, v0, v3

    sput-object v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;->$VALUES:[Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 59
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;
    .locals 1
    .parameter "name"

    .prologue
    .line 59
    const-class v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;
    .locals 1

    .prologue
    .line 59
    sget-object v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;->$VALUES:[Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    return-object v0
.end method
