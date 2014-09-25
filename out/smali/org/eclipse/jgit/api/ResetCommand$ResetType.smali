.class public final enum Lorg/eclipse/jgit/api/ResetCommand$ResetType;
.super Ljava/lang/Enum;
.source "ResetCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/ResetCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ResetType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/api/ResetCommand$ResetType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/api/ResetCommand$ResetType;

.field public static final enum HARD:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

.field public static final enum KEEP:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

.field public static final enum MERGE:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

.field public static final enum MIXED:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

.field public static final enum SOFT:Lorg/eclipse/jgit/api/ResetCommand$ResetType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 92
    new-instance v0, Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    const-string v1, "SOFT"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/ResetCommand$ResetType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/ResetCommand$ResetType;->SOFT:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    .line 97
    new-instance v0, Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    const-string v1, "MIXED"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/api/ResetCommand$ResetType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/ResetCommand$ResetType;->MIXED:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    .line 102
    new-instance v0, Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    const-string v1, "HARD"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/api/ResetCommand$ResetType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/ResetCommand$ResetType;->HARD:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    .line 109
    new-instance v0, Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    const-string v1, "MERGE"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/api/ResetCommand$ResetType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/ResetCommand$ResetType;->MERGE:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    .line 115
    new-instance v0, Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    const-string v1, "KEEP"

    invoke-direct {v0, v1, v6}, Lorg/eclipse/jgit/api/ResetCommand$ResetType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/api/ResetCommand$ResetType;->KEEP:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    .line 88
    const/4 v0, 0x5

    new-array v0, v0, [Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    sget-object v1, Lorg/eclipse/jgit/api/ResetCommand$ResetType;->SOFT:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/api/ResetCommand$ResetType;->MIXED:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/api/ResetCommand$ResetType;->HARD:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/api/ResetCommand$ResetType;->MERGE:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/api/ResetCommand$ResetType;->KEEP:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    aput-object v1, v0, v6

    sput-object v0, Lorg/eclipse/jgit/api/ResetCommand$ResetType;->$VALUES:[Lorg/eclipse/jgit/api/ResetCommand$ResetType;

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
    .line 88
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/api/ResetCommand$ResetType;
    .locals 1
    .parameter "name"

    .prologue
    .line 88
    const-class v0, Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/api/ResetCommand$ResetType;
    .locals 1

    .prologue
    .line 88
    sget-object v0, Lorg/eclipse/jgit/api/ResetCommand$ResetType;->$VALUES:[Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/api/ResetCommand$ResetType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    return-object v0
.end method
