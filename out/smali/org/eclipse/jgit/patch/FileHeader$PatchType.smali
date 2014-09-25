.class public final enum Lorg/eclipse/jgit/patch/FileHeader$PatchType;
.super Ljava/lang/Enum;
.source "FileHeader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/patch/FileHeader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PatchType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/patch/FileHeader$PatchType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/patch/FileHeader$PatchType;

.field public static final enum BINARY:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

.field public static final enum GIT_BINARY:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

.field public static final enum UNIFIED:Lorg/eclipse/jgit/patch/FileHeader$PatchType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 107
    new-instance v0, Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    const-string v1, "UNIFIED"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/patch/FileHeader$PatchType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->UNIFIED:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    .line 110
    new-instance v0, Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    const-string v1, "BINARY"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/patch/FileHeader$PatchType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->BINARY:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    .line 113
    new-instance v0, Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    const-string v1, "GIT_BINARY"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/patch/FileHeader$PatchType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->GIT_BINARY:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    .line 105
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    sget-object v1, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->UNIFIED:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->BINARY:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->GIT_BINARY:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    aput-object v1, v0, v4

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->$VALUES:[Lorg/eclipse/jgit/patch/FileHeader$PatchType;

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
    .line 105
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/patch/FileHeader$PatchType;
    .locals 1
    .parameter "name"

    .prologue
    .line 105
    const-class v0, Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/patch/FileHeader$PatchType;
    .locals 1

    .prologue
    .line 105
    sget-object v0, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->$VALUES:[Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/patch/FileHeader$PatchType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    return-object v0
.end method
