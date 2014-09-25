.class final Lorg/eclipse/jgit/fnmatch/GroupHead;
.super Lorg/eclipse/jgit/fnmatch/AbstractHead;
.source "GroupHead.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterPattern;,
        Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterRange;,
        Lorg/eclipse/jgit/fnmatch/GroupHead$DigitPattern;,
        Lorg/eclipse/jgit/fnmatch/GroupHead$LetterPattern;,
        Lorg/eclipse/jgit/fnmatch/GroupHead$LowerPattern;,
        Lorg/eclipse/jgit/fnmatch/GroupHead$OneCharacterPattern;,
        Lorg/eclipse/jgit/fnmatch/GroupHead$PunctPattern;,
        Lorg/eclipse/jgit/fnmatch/GroupHead$UpperPattern;,
        Lorg/eclipse/jgit/fnmatch/GroupHead$WhitespacePattern;
    }
.end annotation


# static fields
.field private static final REGEX_PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field private final characterClasses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterPattern;",
            ">;"
        }
    .end annotation
.end field

.field private final inverse:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 59
    const-string v0, "([^-][-][^-]|\\[[.:=].*?[.:=]\\])"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/fnmatch/GroupHead;->REGEX_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 11
    .parameter "pattern"
    .parameter "wholePattern"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/InvalidPatternException;
        }
    .end annotation

    .prologue
    .line 66
    const/4 v7, 0x0

    invoke-direct {p0, v7}, Lorg/eclipse/jgit/fnmatch/AbstractHead;-><init>(Z)V

    .line 67
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    .line 68
    const-string v7, "!"

    invoke-virtual {p1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    iput-boolean v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->inverse:Z

    .line 69
    iget-boolean v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->inverse:Z

    if-eqz v7, :cond_0

    .line 70
    const/4 v7, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 72
    :cond_0
    sget-object v7, Lorg/eclipse/jgit/fnmatch/GroupHead;->REGEX_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v7, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .line 73
    .local v4, matcher:Ljava/util/regex/Matcher;
    :goto_0
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v7

    if-eqz v7, :cond_f

    .line 74
    const/4 v7, 0x0

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 75
    .local v1, characterClass:Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    const/4 v8, 0x3

    if-ne v7, v8, :cond_1

    const/4 v7, 0x1

    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x2d

    if-ne v7, v8, :cond_1

    .line 76
    const/4 v7, 0x0

    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 77
    .local v6, start:C
    const/4 v7, 0x2

    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 78
    .local v2, end:C
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    new-instance v8, Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterRange;

    invoke-direct {v8, v6, v2}, Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterRange;-><init>(CC)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .end local v2           #end:C
    .end local v6           #start:C
    :goto_1
    const-string v7, ""

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->replaceFirst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 124
    invoke-virtual {v4, p1}, Ljava/util/regex/Matcher;->reset(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    goto :goto_0

    .line 79
    :cond_1
    const-string v7, "[:alnum:]"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 80
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    sget-object v8, Lorg/eclipse/jgit/fnmatch/GroupHead$LetterPattern;->INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$LetterPattern;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    sget-object v8, Lorg/eclipse/jgit/fnmatch/GroupHead$DigitPattern;->INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$DigitPattern;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 82
    :cond_2
    const-string v7, "[:alpha:]"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 83
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    sget-object v8, Lorg/eclipse/jgit/fnmatch/GroupHead$LetterPattern;->INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$LetterPattern;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 84
    :cond_3
    const-string v7, "[:blank:]"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 85
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    new-instance v8, Lorg/eclipse/jgit/fnmatch/GroupHead$OneCharacterPattern;

    const/16 v9, 0x20

    invoke-direct {v8, v9}, Lorg/eclipse/jgit/fnmatch/GroupHead$OneCharacterPattern;-><init>(C)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    new-instance v8, Lorg/eclipse/jgit/fnmatch/GroupHead$OneCharacterPattern;

    const/16 v9, 0x9

    invoke-direct {v8, v9}, Lorg/eclipse/jgit/fnmatch/GroupHead$OneCharacterPattern;-><init>(C)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 87
    :cond_4
    const-string v7, "[:cntrl:]"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 88
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    new-instance v8, Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterRange;

    const/4 v9, 0x0

    const/16 v10, 0x1f

    invoke-direct {v8, v9, v10}, Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterRange;-><init>(CC)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    new-instance v8, Lorg/eclipse/jgit/fnmatch/GroupHead$OneCharacterPattern;

    const/16 v9, 0x7f

    invoke-direct {v8, v9}, Lorg/eclipse/jgit/fnmatch/GroupHead$OneCharacterPattern;-><init>(C)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 90
    :cond_5
    const-string v7, "[:digit:]"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 91
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    sget-object v8, Lorg/eclipse/jgit/fnmatch/GroupHead$DigitPattern;->INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$DigitPattern;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 92
    :cond_6
    const-string v7, "[:graph:]"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 93
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    new-instance v8, Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterRange;

    const/16 v9, 0x21

    const/16 v10, 0x7e

    invoke-direct {v8, v9, v10}, Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterRange;-><init>(CC)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    sget-object v8, Lorg/eclipse/jgit/fnmatch/GroupHead$LetterPattern;->INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$LetterPattern;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    sget-object v8, Lorg/eclipse/jgit/fnmatch/GroupHead$DigitPattern;->INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$DigitPattern;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 96
    :cond_7
    const-string v7, "[:lower:]"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 97
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    sget-object v8, Lorg/eclipse/jgit/fnmatch/GroupHead$LowerPattern;->INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$LowerPattern;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 98
    :cond_8
    const-string v7, "[:print:]"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 99
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    new-instance v8, Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterRange;

    const/16 v9, 0x20

    const/16 v10, 0x7e

    invoke-direct {v8, v9, v10}, Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterRange;-><init>(CC)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    sget-object v8, Lorg/eclipse/jgit/fnmatch/GroupHead$LetterPattern;->INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$LetterPattern;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    sget-object v8, Lorg/eclipse/jgit/fnmatch/GroupHead$DigitPattern;->INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$DigitPattern;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 102
    :cond_9
    const-string v7, "[:punct:]"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 103
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    sget-object v8, Lorg/eclipse/jgit/fnmatch/GroupHead$PunctPattern;->INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$PunctPattern;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 104
    :cond_a
    const-string v7, "[:space:]"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_b

    .line 105
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    sget-object v8, Lorg/eclipse/jgit/fnmatch/GroupHead$WhitespacePattern;->INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$WhitespacePattern;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 106
    :cond_b
    const-string v7, "[:upper:]"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 107
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    sget-object v8, Lorg/eclipse/jgit/fnmatch/GroupHead$UpperPattern;->INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$UpperPattern;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 108
    :cond_c
    const-string v7, "[:xdigit:]"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 109
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    new-instance v8, Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterRange;

    const/16 v9, 0x30

    const/16 v10, 0x39

    invoke-direct {v8, v9, v10}, Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterRange;-><init>(CC)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    new-instance v8, Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterRange;

    const/16 v9, 0x61

    const/16 v10, 0x66

    invoke-direct {v8, v9, v10}, Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterRange;-><init>(CC)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    new-instance v8, Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterRange;

    const/16 v9, 0x41

    const/16 v10, 0x46

    invoke-direct {v8, v9, v10}, Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterRange;-><init>(CC)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 112
    :cond_d
    const-string v7, "[:word:]"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_e

    .line 113
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    new-instance v8, Lorg/eclipse/jgit/fnmatch/GroupHead$OneCharacterPattern;

    const/16 v9, 0x5f

    invoke-direct {v8, v9}, Lorg/eclipse/jgit/fnmatch/GroupHead$OneCharacterPattern;-><init>(C)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    sget-object v8, Lorg/eclipse/jgit/fnmatch/GroupHead$LetterPattern;->INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$LetterPattern;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    sget-object v8, Lorg/eclipse/jgit/fnmatch/GroupHead$DigitPattern;->INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$DigitPattern;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 117
    :cond_e
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->characterClassIsNotSupported:Ljava/lang/String;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v1, v8, v9

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 120
    .local v5, message:Ljava/lang/String;
    new-instance v7, Lorg/eclipse/jgit/errors/InvalidPatternException;

    invoke-direct {v7, v5, p2}, Lorg/eclipse/jgit/errors/InvalidPatternException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v7

    .line 127
    .end local v1           #characterClass:Ljava/lang/String;
    .end local v5           #message:Ljava/lang/String;
    :cond_f
    const/4 v3, 0x0

    .local v3, i:I
    :goto_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v3, v7, :cond_10

    .line 128
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 129
    .local v0, c:C
    iget-object v7, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    new-instance v8, Lorg/eclipse/jgit/fnmatch/GroupHead$OneCharacterPattern;

    invoke-direct {v8, v0}, Lorg/eclipse/jgit/fnmatch/GroupHead$OneCharacterPattern;-><init>(C)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 131
    .end local v0           #c:C
    :cond_10
    return-void
.end method


# virtual methods
.method protected final matches(C)Z
    .locals 3
    .parameter "c"

    .prologue
    .line 135
    iget-object v2, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->characterClasses:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterPattern;

    .line 136
    .local v1, pattern:Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterPattern;
    invoke-interface {v1, p1}, Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterPattern;->matches(C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 137
    iget-boolean v2, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->inverse:Z

    if-nez v2, :cond_1

    const/4 v2, 0x1

    .line 140
    .end local v1           #pattern:Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterPattern;
    :goto_0
    return v2

    .line 137
    .restart local v1       #pattern:Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterPattern;
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 140
    .end local v1           #pattern:Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterPattern;
    :cond_2
    iget-boolean v2, p0, Lorg/eclipse/jgit/fnmatch/GroupHead;->inverse:Z

    goto :goto_0
.end method
