-- Generated by CSharp.lua Compiler
--[[
Copyright 2017 YANG Huan (sy.yanghuan@gmail.com).

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
]]
local System = System
local MicrosoftCodeAnalysisCSharp = Microsoft.CodeAnalysis.CSharp
local CSharpLuaLuaAst
System.usingDeclare(function (global)
  CSharpLuaLuaAst = CSharpLua.LuaAst
end)
System.namespace("CSharpLua.LuaAst", function (namespace)
  namespace.class("LuaLiteralExpressionSyntax", function (namespace)
    local __ctor__
    __ctor__ = function (this)
      CSharpLuaLuaAst.LuaExpressionSyntax.__ctor__(this)
    end
    return {
      __inherits__ = function (global)
        return {
          global.CSharpLua.LuaAst.LuaExpressionSyntax
        }
      end,
      __ctor__ = __ctor__
    }
  end)

  namespace.class("LuaIdentifierLiteralExpressionSyntax", function (namespace)
    local getText, Render, Nil, Zero, ZeroFloat, True, False, class, 
    __staticCtor__, __ctor1__, __ctor2__
    __staticCtor__ = function (this)
      Nil = class:new(2, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Nil)
      Zero = class:new(1, "0")
      ZeroFloat = class:new(1, "0.0")
      True = class:new(2, CSharpLuaLuaAst.LuaIdentifierNameSyntax.True)
      False = class:new(2, CSharpLuaLuaAst.LuaIdentifierNameSyntax.False)
      this.Nil, this.Zero, this.ZeroFloat, this.True, this.False = Nil, Zero, ZeroFloat, True, False
    end
    __ctor1__ = function (this, text)
      __ctor2__(this, CSharpLuaLuaAst.LuaIdentifierNameSyntax:new(1, text))
    end
    __ctor2__ = function (this, identifier)
      this.__base__.__ctor__(this)
      this.Identifier = identifier
    end
    getText = function (this)
      return this.Identifier.ValueText
    end
    Render = function (this, renderer)
      renderer:Render14(this)
    end
    class = {
      __inherits__ = function (global)
        return {
          global.CSharpLua.LuaAst.LuaLiteralExpressionSyntax
        }
      end,
      getText = getText,
      Render = Render,
      __staticCtor__ = __staticCtor__,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      }
    }
    return class
  end)

  namespace.class("LuaStringLiteralExpressionSyntax", function (namespace)
    local getOpenParenToken, getCloseParenToken, getText, Render, Empty, class, __staticCtor__, __ctor__
    __staticCtor__ = function (this)
      Empty = class(CSharpLuaLuaAst.LuaIdentifierNameSyntax.Empty)
      this.Empty = Empty
    end
    __ctor__ = function (this, identifier)
      this.__base__.__ctor__(this)
      this.Identifier = identifier
    end
    getOpenParenToken = function (this)
      return "\"" --[[Tokens.Quote]]
    end
    getCloseParenToken = function (this)
      return "\"" --[[Tokens.Quote]]
    end
    getText = function (this)
      return this.Identifier.ValueText
    end
    Render = function (this, renderer)
      renderer:Render15(this)
    end
    class = {
      __inherits__ = function (global)
        return {
          global.CSharpLua.LuaAst.LuaLiteralExpressionSyntax
        }
      end,
      getOpenParenToken = getOpenParenToken,
      getCloseParenToken = getCloseParenToken,
      getText = getText,
      Render = Render,
      __staticCtor__ = __staticCtor__,
      __ctor__ = __ctor__
    }
    return class
  end)

  namespace.class("LuaVerbatimStringLiteralExpressionSyntax", function (namespace)
    local getText, setText, getOpenBracket, getCloseBracket, Render, __ctor__
    __ctor__ = function (this, value, checkNewLine)
      this.__base__.__ctor__(this)
      local equals = ("=" --[[Tokens.Equals]]):get(0)
      local count = 0
      while true do
        local closeToken = (getCloseBracket(this) .. System.String(equals, count)) .. getCloseBracket(this)
        if not value:Contains(closeToken) then
          break
        end
        count = count + 1
      end
      if checkNewLine then
        if value:get(0) == 10 --[['\n']] then
          value = '\n' .. value
        end
      end
      setText(this, value)
      this.EqualsCount = count
    end
    getText, setText = System.property("Text1")
    getOpenBracket = function (this)
      return "[" --[[Tokens.OpenBracket]]
    end
    getCloseBracket = function (this)
      return "]" --[[Tokens.CloseBracket]]
    end
    Render = function (this, renderer)
      renderer:Render16(this)
    end
    return {
      __inherits__ = function (global)
        return {
          global.CSharpLua.LuaAst.LuaLiteralExpressionSyntax
        }
      end,
      getText = getText,
      setText = setText,
      EqualsCount = 0,
      getOpenBracket = getOpenBracket,
      getCloseBracket = getCloseBracket,
      Render = Render,
      __ctor__ = __ctor__
    }
  end)

  namespace.class("LuaConstLiteralExpression", function (namespace)
    local getOpenComment, getCloseComment, getText, Render, __ctor1__, __ctor2__
    __ctor1__ = function (this, value, identifierToken)
      __ctor2__(this, CSharpLuaLuaAst.LuaIdentifierLiteralExpressionSyntax:new(1, value), identifierToken)
    end
    __ctor2__ = function (this, value, identifierToken)
      CSharpLuaLuaAst.LuaLiteralExpressionSyntax.__ctor__(this)
      this.Value = value
      this.IdentifierToken = identifierToken
    end
    getOpenComment = function (this)
      return "--[[" --[[Tokens.OpenLongComment]]
    end
    getCloseComment = function (this)
      return "]]" --[[Tokens.CloseDoubleBrace]]
    end
    getText = function (this)
      return this.Value:getText()
    end
    Render = function (this, renderer)
      renderer:Render17(this)
    end
    return {
      __inherits__ = function (global)
        return {
          global.CSharpLua.LuaAst.LuaLiteralExpressionSyntax
        }
      end,
      getOpenComment = getOpenComment,
      getCloseComment = getCloseComment,
      getText = getText,
      Render = Render,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      }
    }
  end)

  namespace.class("LuaCharacterLiteralExpression", function (namespace)
    local GetIdentifierToken, __ctor__
    __ctor__ = function (this, character)
      this.__base__.__ctor__[1](this, (character):ToString(), GetIdentifierToken(character))
    end
    GetIdentifierToken = function (character)
      return MicrosoftCodeAnalysisCSharp.SyntaxFactory.Literal(character):getText()
    end
    return {
      __inherits__ = function (global)
        return {
          global.CSharpLua.LuaAst.LuaConstLiteralExpression
        }
      end,
      __ctor__ = __ctor__
    }
  end)
end)
